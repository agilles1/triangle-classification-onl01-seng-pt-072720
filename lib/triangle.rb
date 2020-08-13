require 'pry'
class Triangle
  attr_accessor :triangle, :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b 
    @c = c 
    @triangle = [a, b, c]
  end

  def pos_triangle?
    @triangle.all? {|sides| sides.positive?}
  end

  def eq_triangle?
    if a + b <= c || b + c <= a || c + a <= b
      false
    else
      true
    end
  end

  def kind
    if !pos_triangle? || !eq_triangle?
      begin
        raise TriangleError
      end
    elsif a == b && b == c
      :equilateral
    elsif a != b && b != c && a != c
      :scalene
    else 
      :isosceles
    end
  end

  class TriangleError < StandardError
    
  end
end

