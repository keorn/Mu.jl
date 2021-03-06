"Vector with pointer to element"
mutable struct CountVec{T}  
  data::Vector{T}
  count::Int
end

CountVec(xs::Vector{T}) where T = CountVec{T}(xs, 1)
CountVec{T}() where T =  CountVec{T}(T[], 1)
Base.copy(cvec::CountVec{T}) where T = CountVec{T}(cvec.data, cvec.count) 

function next!(cv::CountVec, ::Type{T}) where T
  # if cv.count > length(cv.data)
  #   push!(cv.data, rand(T))
  # end 
  # val = cv.data[cv.count]
  # cv.count =+ 1
  # val
  val = if cv.count <= length(cv.data)
    cv.data[cv.count]
  else
    # @assert cv.count == length(cv.data) + 1
    cv.count += 1
    val = rand(T)
    push!(cv.data, val)
    val
  end
  cv.count += 1
  val 
end

resetcount!(cv::CountVec) = cv.count = 1
resetcount(cvec::CountVec{T}) where T = CountVec{T}(cvec.data, 1)