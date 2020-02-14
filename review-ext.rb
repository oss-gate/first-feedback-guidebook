# Support "child" format
# https://review-knowledge-ja.readthedocs.io/ja/latest/reviewext/nest.html
module ReVIEW
  module BuilderOverride
    Compiler.defsingle :child, 1

    def child(tag)
      @children ||= []
      puts "♬→#{tag}←♬"
      if tag.start_with?('/')
        if @children.empty?
          error "#{tag} is shown but there isn't any opened //child"
        elsif @children[-1] != tag.sub('/', '')
          error "#{tag} is shown but previous '#{@children[-1]}' is not closed yet"
        else
          @children.pop
        end
      else
        unless %w(dl ol ul).include?(tag)
          error "#{tag} is invalid value for //child (dl, ol, or ul)"
        end
        @children.push(tag)
      end
    end
  end

  class Builder
    prepend BuilderOverride
  end

  module LATEXBuilderOverride
    def solve_nest(s)
      s = s.
            gsub("\\end{description}\n\n♬→dl←♬\n", "\n").
            gsub('♬→/dl←♬', '\\end{description}←END♬').
            gsub("\\end{itemize}\n\n♬→ul←♬\n", "\n").
            gsub('♬→/ul←♬', '\\end{itemize}←END♬').
            gsub("\\end{enumerate}\n\n♬→ol←♬\n", "\n").
            gsub('♬→/ol←♬', '\\end{enumerate}←END♬').
            gsub("\\end{description}←END♬\n\n\\begin{description}", '').
            gsub("\\end{itemize}←END♬\n\n\\begin{itemize}", '').
            gsub("\\end{enumerate}←END♬\n\n\\begin{enumerate}", '').
            gsub('←END♬', '')

      if s =~ /♬→(.+?)←♬/
        error "Last //child[#{$1}] isn't closed yet."
      end

      s
    end

    def result
      solve_nest(super)
    end
  end

  class LATEXBuilder
    prepend LATEXBuilderOverride
  end

  module HTMLBuilderOverride
    def solve_nest(s)
      s = s.
            gsub("</dd>\n</dl>\n♬→dl←♬", '').
            gsub('♬→/dl←♬', "</dd>\n</dl>←END♬").
            gsub("</li>\n</ul>\n♬→ul←♬", '').
            gsub('♬→/ul←♬', "</li>\n</ul>←END♬").
            gsub("</li>\n</ol>\n♬→ol←♬", '').
            gsub('♬→/ol←♬', "</li>\n</ol>←END♬").
            gsub("</dl>←END♬\n<dl>", '').
            gsub("</ul>←END♬\n<ul>", '').
            gsub("</ol>←END♬\n<ol>", '').
            gsub('←END♬', '')

      if s =~ /♬→(.+?)←♬/
        error "Last //child[#{$1}] isn't closed yet."
      end

      s
    end

    def result
      solve_nest(super)
    end
  end

  class HTMLBuilder
    prepend HTMLBuilderOverride
  end

  module IDGXMLBuilderOverride
    def solve_nest(s)
      s = s.
            gsub("</dd></dl>♬→dl←♬", '').
            gsub('♬→/dl←♬', "</dd></dl>←END♬").
            gsub("</li></ul>♬→ul←♬", '').
            gsub('♬→/ul←♬', "</li></ul>←END♬").
            gsub("</li></ol>♬→ol←♬", '').
            gsub('♬→/ol←♬', "</li></ol>←END♬").
            gsub("</dl>←END♬<dl>", '').
            gsub("</ul>←END♬<ul>", '').
            gsub("</ol>←END♬<ol>", '').
            gsub('←END♬', '')

      if s =~ /♬→(.+?)←♬/
        error "Last //child[#{$1}] isn't closed yet."
      end

      s
    end

    def result
      solve_nest(super)
    end
  end

  class IDGXMLBuilder
    prepend IDGXMLBuilderOverride
  end

  module PLAINTEXTBuilderOverride
    def solve_nest(s)
      lines = []
      @children = []
      s.split("\n").each do |l|
        if l =~ /\A♬→(dl|ul|ol)←♬/
          @children.push($1)
          lines.push('♬→END←♬')
        elsif l =~ /\A♬→\/(dl|ul|ol)←♬/
          @children.pop
          lines.push('♬→END←♬')
        else
          lines.push("\t" * @children.size + l)
        end
      end

      s = lines.join("\n").gsub(/\n*♬→END←♬\n*/, "\n")

      if s =~ /♬→(.+?)←♬/
        error "Last //child[#{$1}] isn't closed yet."
      end

      s
    end

    def result
      solve_nest(super)
    end
  end

  class PLAINTEXTBuilder
    prepend PLAINTEXTBuilderOverride
  end
end


# Convert link to footnote
# https://gist.github.com/kauplan/973d5037e2cc0f8edb474bd0960c2dcc
ReVIEW::LATEXBuilder.class_eval do
  def compile_href(url, label)
    if /\A[a-z]+:/ =~ url
      if label and url != label
        #macro('href', escape_url(url), escape(label)) # original
        escape(label) + macro('footnote', macro('url', escape_url(url)))
      else
        macro('url', escape_url(url))
      end
    else
      macro('ref', url)
    end
  end
end

# Break lines in code block
# https://review-knowledge-ja.readthedocs.io/ja/latest/latex/linebreak-verbatim.html
module ReVIEW
  module LATEXBuilderOverride
    # gem install unicode-display_width
    require 'unicode/display_width'
    require 'unicode/display_width/string_ext'

    CR = '　' # 送り出し文字。LaTeXコードも可
    ZWSCALE = 0.875 # 和文・欧文の比率。\setlength{\xkanjiskip}{\z@} しておいたほうがよさそう

    def split_line(s, n)
      # 文字列を幅nで分割
      a = []
      l = ''
      w = 0
      s.each_char do |c|
        cw = c.display_width(2) # Ambiguousを全角扱い
        cw *= ZWSCALE if cw == 2
        
        if w + cw > n
          a.push(l)
          l = c
          w = cw
        else
          l << c
          w += cw
        end
      end
      a.push(l)
      a
    end

    def code_line(type, line, idx, id, caption, lang)
      # _typeには'emlist'などが入ってくるので、環境に応じて分岐は可能
      n = 80
      n = 72 if @doc_status[:column]
      a = split_line(unescape(detab(line)), n)
      # インラインopはこの時点でもう展開されたものが入ってしまっているので、escapeでエスケープされてしまう…
      escape(a.join("\x01\n")).gsub("\x01", CR) + "\n"
    end

    def code_line_num(type, line, first_line_num, idx, id, caption, lang)
      n = 80
      n = 72 if @doc_status[:column]
      a = split_line(unescape(detab(line)), n)
      (idx + first_line_num).to_s.rjust(2) + ': ' + escape(a.join("\x01\n    ")).gsub("\x01", CR) + "\n"
    end
  end

  class LATEXBuilder
    prepend LATEXBuilderOverride
  end
end
