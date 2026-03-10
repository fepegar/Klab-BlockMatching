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
- NIfTI library (optional, enables NIfTI read/write support)

### Build

```bash
cmake -B build -DCMAKE_BUILD_TYPE=Release -Dvt_USE_OPENMP=ON
cmake --build build --parallel
```

Binaries will be in `build/bin/`.

To enable NIfTI support, first configure the vendored NIfTI dependency and
point the main build at its build tree:

```bash
cmake -S external/NIFTICLIB/nifticlib-2.0.0 -B build-nifti -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF
cmake --build build-nifti --target znz niftiio --parallel
cmake -B build -DCMAKE_BUILD_TYPE=Release -Dvt_USE_OPENMP=ON -DNIFTI_DIR="$PWD/build-nifti"
cmake --build build --parallel
```

A dedicated Linux CI job validates this optional NIfTI path by generating a
`.nii.gz` file with `test-libio` and reading it back.

## License

Copyright © INRIA 2016. See [LICENSE.txt](LICENSE.txt) for details.

## Authors

- Grégoire Malandain (gregoire.malandain@inria.fr)
- Étienne Delclaux (etienne.delclaux@inria.fr)

## Upstream

The original source code is maintained at: https://gitlab.inria.fr/greg/Klab-BlockMatching
