# Building from source

## Dependencies

- **CMake** ≥ 2.8
- **zlib** (required)
- **OpenMP** (optional, recommended for parallel computation)

### Installing dependencies

=== "Ubuntu / Debian"

    ```bash
    sudo apt-get install -y cmake zlib1g-dev
    ```

=== "macOS (Homebrew)"

    ```bash
    brew install cmake libomp
    ```

## Build

```bash
git clone https://github.com/fepegar/Klab-BlockMatching.git
cd Klab-BlockMatching
cmake -B build -DCMAKE_BUILD_TYPE=Release -Dvt_USE_OPENMP=ON
cmake --build build --parallel
```

Binaries will be placed in `build/bin/`.

### macOS OpenMP note

On macOS, you may need to point CMake to Homebrew's libomp:

```bash
export LDFLAGS="-L$(brew --prefix libomp)/lib"
export CPPFLAGS="-I$(brew --prefix libomp)/include"
cmake -B build -DCMAKE_BUILD_TYPE=Release -Dvt_USE_OPENMP=ON
cmake --build build --parallel
```

## CMake options

| Option | Default | Description |
|---|---|---|
| `BUILD_SHARED_LIBS` | `ON` | Build shared libraries |
| `vt_USE_OPENMP` | `OFF` | Enable OpenMP parallelization |
| `BUILD_TESTING` | `OFF` | Build tests |
| `CMAKE_BUILD_TYPE` | — | `Release`, `Debug`, `RelWithDebInfo` |
