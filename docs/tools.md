# Tools

Klab-BlockMatching provides the following command-line tools:

## Registration

### `blockmatching`

Block matching-based image registration. This is the main tool for computing
transformations between images using block matching.

### `pointmatching`

Point matching-based registration. Computes transformations from corresponding
point sets.

## Transformations

### `applyTrsf`

Apply a transformation to an image.

### `applyTrsfToPoints`

Apply a transformation to a set of points.

### `composeTrsf`

Compose two or more transformations into a single transformation.

### `copyTrsf`

Copy a transformation file.

### `createTrsf`

Create a transformation (e.g., identity, random).

### `invTrsf`

Invert a transformation.

### `intermediaryTrsf`

Compute intermediary transformations (e.g., for temporal interpolation).

## Image utilities

### `cropImage`

Crop an image to a specified region.

### `interpolateImages`

Interpolate between images.

### `buildPyramidImage`

Build multi-resolution image pyramids for hierarchical registration.

### `createGrid`

Create a deformation grid visualization.

### `printImage`

Print image metadata and information.

### `printTrsf`

Print transformation metadata and information.
