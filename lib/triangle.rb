class Triangle
  attr_reader :a, :b, :c
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def positive_sides
    pos=true 
    pos=false if a<0
    pos=false if b<0
    pos=false if c<0
    pos
  end

  def is_triangle 
    a+b > c && b+c > a && c+a > b
  end

  def validate_triangle
    vt=true
    vt =false if positive_sides ==false
    vt=false if is_triangle == false
    raise TriangleError if vt == false
  end

  class TriangleError < StandardError
    def message 
      "Bad Bad Bad Triangle"
    end
  end

end

