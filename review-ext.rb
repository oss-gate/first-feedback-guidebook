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
