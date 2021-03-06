# Autogenerated from a Treetop grammar. Edits may be lost.


module Mail
  module DateTime
    include Treetop::Runtime

    def root
      @root ||= :primary
    end

    include RFC2822

    module Primary0
      def day_of_week
        elements[0]
      end

    end

    module Primary1
      def date
        elements[1]
      end

      def FWS
        elements[2]
      end

      def time
        elements[3]
      end

    end

    def _nt_primary
      start_index = index
      if node_cache[:primary].has_key?(index)
        cached = node_cache[:primary][index]
        @index = cached.interval.end if cached
        return cached
      end

      i0, s0 = index, []
      i2, s2 = index, []
      r3 = _nt_day_of_week
      s2 << r3
      if r3
        if has_terminal?(",", false, index)
          r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(",")
          r4 = nil
        end
        s2 << r4
      end
      if s2.last
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
        r2.extend(Primary0)
      else
        @index = i2
        r2 = nil
      end
      if r2
        r1 = r2
      else
        r1 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r1
      if r1
        r5 = _nt_date
        s0 << r5
        if r5
          r6 = _nt_FWS
          s0 << r6
          if r6
            r7 = _nt_time
            s0 << r7
            if r7
              r9 = _nt_CFWS
              if r9
                r8 = r9
              else
                r8 = instantiate_node(SyntaxNode,input, index...index)
              end
              s0 << r8
            end
          end
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Primary1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:primary][start_index] = r0

      r0
    end

  end

  class DateTimeParser < Treetop::Runtime::CompiledParser
    include DateTime
  end

end