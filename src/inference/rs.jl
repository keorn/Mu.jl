"Rejection Sampling"
abstract type RejectionSample <: Algorithm end

"Sample from `x | y == true` with rejection sampling"
function Base.rand(OmegaT::Type{OT}, y::RandVar, alg::Type{RejectionSample};
                   n = 100,
                   cb = default_cbs(n)) where {OT <: Omega}
  cb = runall(cb)
  samples = OmegaT[]
  accepted = 1
  i = 1
  while accepted < n
    ω = OmegaT()
    if epsilon(y(ω)) == 1.0
      push!(samples, ω)
      accepted += 1
      cb(RunData(ω, accepted, 0.0, accepted))
    else
      cb(RunData(ω, accepted, 1.0, i))
    end
    i += 1
  end
  samples
end