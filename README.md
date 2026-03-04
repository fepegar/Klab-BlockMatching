# Klab-BlockMatching

> **This is a clone of the original [Klab-BlockMatching](https://gitlab.inria.fr/greg/Klab-BlockMatching) repository hosted on GitLab (INRIA). Pre-built binaries are provided via GitHub Releases for convenience.**

A block matching-based image registration library developed by the [MORPHEME team](https://team.inria.fr/morpheme/) at [INRIA](https://www.inria.fr/).

## Pre-built binaries

Download pre-built binaries from the [Releases](https://github.com/fepegar/Klab-BlockMatching/releases) page. Available platforms:

| Platform | OpenMP | Archive |
|---|---|---|
| Linux x86_64 | ✅ | `.tar.gz` |
| macOS arm64 (Apple Silicon) | ✅ | `.tar.gz` |
| macOS x86_64 (Intel) | ❌ | `.tar.gz` |

## Included tools

- `blockmatching` — Block matching-based image registration
- `applyTrsf` — Apply a transformation to an image
- `applyTrsfToPoints` — Apply a transformation to point sets
- `composeTrsf` — Compose transformations
- `copyTrsf` — Copy transformations
- `createGrid` — Create a deformation grid
- `createTrsf` — Create a transformation
- `cropImage` — Crop an image
- `intermediaryTrsf` — Compute intermediary transformations
- `interpolateImages` — Interpolate between images
- `invTrsf` — Invert a transformation
- `pointmatching` — Point matching-based registration
- `buildPyramidImage` — Build image pyramids
- `printImage` — Print image information
- `printTrsf` — Print transformation information

## Building from source

### Dependencies

- CMake ≥ 2.8
- zlib (required)
- OpenMP (optional, recommended)

### Build

```bash
cmake -B build -DCMAKE_BUILD_TYPE=Release -Dvt_USE_OPENMP=ON
cmake --build build --parallel
```

Binaries will be in `build/bin/`.

## License

Copyright © INRIA 2016. See [LICENSE.txt](LICENSE.txt) for details.

## Authors

- Grégoire Malandain (gregoire.malandain@inria.fr)
- Étienne Delclaux (etienne.delclaux@inria.fr)

## Upstream

The original source code is maintained at: https://gitlab.inria.fr/greg/Klab-BlockMatching
