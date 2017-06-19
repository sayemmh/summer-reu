# summer-reu
## stabilization of videos with atmospheric turbulence distortion
---
### Week 1:
Paper - [Video dejittering by bake and shake](http://dl.acm.org/citation.cfm?id=1709255)
1. implement a uniformly distributed 1-dimensional horizontal jitter
  - `jitter.m` apply the jitter to an input image
2. implement anisotropic and isotropic diffusion algorithms
  - `heatequation.m` heat equation - isotropic diffusion algorithm
  - `totalvariationdenoising.m` total variation denoising - anisotropic diffusion algorithm
  - `peronamalik.m` perona malik - anisotropic diffusion algorithm
  - `test_dejitter.m` apply isotropic and anisotropic diffusion algorithms to jittered image
3. compare the two types of diffusion algos and resulting edges
<p align="center">
<img src="https://raw.githubusercontent.com/sayemmh/summer-reu/master/week1/report/three.jpg">
</p>
---
