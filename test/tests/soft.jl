using Mu
using UnicodePlots

function test()
  x = normal(0.0, 1.0)
  y = normal(0.0, 1.0)
  coldsamples = withkernel(Mu.kseα(10.0)) do
    rand((x, y), x == y)
  end
  print(UnicodePlots.densityplot(ntranspose(coldsamples)...))

  hotsamples = withkernel(Mu.kseα(0.01)) do
    rand((x, y), x == y)
  end
  print(UnicodePlots.densityplot(ntranspose(hotsamples)...))
end