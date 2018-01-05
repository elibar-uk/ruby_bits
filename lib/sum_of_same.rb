# codility

a = [3, 8, 9, 7, 6]
k = 3

def rotation(a, k)
  i = 1
  @result = a
  while i <= k
    @result.rotate!(-1)
      i += 1
  end
  @result
end


def solution(a)
  a = a.compact
  sum = (a.length + 1) * (a.length + 2) / 2
  sum - a.inject(:+)
end

def solution(a)#permcheck
  a = a.compact.sort!
  a.inject(:+) == (1..a.last).inject(:+) ? 1 : 0
end

def solution(a)
   ar = ((1..a.size).to_a - a).compact
  return a.max + 1 if ar.empty?
  ar.min
end

def solution(x, y, d)
  dist = y - x
  diff = dist % d
  if diff == 0
    dist / d
  else
    (dist / d) + 1
  end
end

def solution(a, b, k)
 (a..b).select{ |c| c % k == 0 }.count
end

def solution(a, b, k)
  if a % k == 0
    a = a
  else
    a += k - a %k
  end
    b -= b % k
    ans =((b-a)/k) + 1
  return ans
end

def solution(a)
  a.repeated_permutation(3).to_a.map{|s| s.inject(:*)}.max
end

non_delimiters = /[^(){}\[\]]*/
Paired = /\(#{non_delimiters}\)|\{#{non_delimiters}\}|\[#{non_delimiters}\]/
Delimiter = /[(){}\[\]]/

def solution(s)
  s = s.dup
  s.gsub!(Paired, "".freeze) while s =~ Paired
  s !~ Delimiter ? 1 : 0
end

def solution(s)
  stack = []
  brackets = { '{' => '}', '[' => ']', '(' => ')' }
  s.each_char do |char|
    stack << char if brackets.key?(char)
    return 0 if brackets.key(char) && brackets.key(char) != stack.pop
  end
  stack.empty? ? 1 : 0
end
# expected 3
k = 2
c = [1,2,1,1]
d = [1,4,3,2,4]
def solution(k, c, d)
  d.permutation(k)
end

def min_perimiter_rectangle(n)
  return 2 * (n + n) if n < 2
  (1..n).to_a.combination(2).to_a.compact
    .select{|a, b| a * b == n}
    .map{|m| 2 * (m.inject(:+))}
    .min
end

def solution(a)#wrong
    b = (0..a.length-1).to_a
    b.combination(2).to_a[1..-1].count
end

def so(a)
  #[3, 2, 3, 4, 3, 3, 3, -1]
  h_len = a.length / 2
  b = a.uniq #[3, 2, 4, -1]
  h = {}
  ar = []
  b.each{|m| a.detect{|n| h[n]= a.count(n) if n == m} }
  h.select{|k,v|  ar << k if v > a.length/2}
   if ar.empty?
     -1
   else
     a.index(ar.first)
   end
end


def frog_jump(x, a)#[1,3,1,4,2,3,5,4] 5
  s = (1..x).to_a
  return -1 if !(s - a).empty?
  r = []
  s.each{|m| r << a.index(m)}
  r.max
end

def solution(a)#MaxProductOfThree 44%
   s = a.combination(3).to_a
   t = s.map { |m| m.inject(:*) }
   t.sort.last
end
