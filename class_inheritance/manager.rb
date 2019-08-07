require_relative 'employee'
require "byebug"


class Manager < Employee

    def initialize(name, title, salary, boss = nil)
        super
        @subordinates = []
    end

    def add_subordinates(new_subordinates)
        self.subordinates += new_subordinates - self.subordinates
    end

    def bonus(multiplier)
        queue = self.subordinates.dup
        total_salaries = 0
        until queue.empty?
            subordinate = queue.shift
            total_salaries += subordinate.salary
            begin
                queue += subordinate.subordinates
            rescue
            end
        end
        total_salaries * multiplier
    end

    protected
    attr_accessor :subordinates


end