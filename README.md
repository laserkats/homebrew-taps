# homebrew-maplibre

Homebrew tap for MapLibre Native tools.

## Installation

```bash
brew tap laserkats/taps
brew install maplibre
```

## Available Formulas

### mbgl-render

MapLibre Native static map renderer CLI. Renders map tiles to PNG images.

```bash
# Render a map centered on coordinates
mbgl-render -s https://demotiles.maplibre.org/style.json -o map.png -x -74 -y 40.7 -z 10 -w 512 -h 512

# Render with custom dimensions and scale
mbgl-render -s style.json -o output.png -w 300 -h 300 -r 3
```

#### Options

- `-s, --style` - Map stylesheet URL or file
- `-o, --output` - Output filename (default: out.png)
- `-x, --lon` - Longitude in degrees
- `-y, --lat` - Latitude in degrees
- `-z, --zoom` - Zoom level
- `-w, --width` - Image width in pixels (default: 512)
- `-h, --height` - Image height in pixels (default: 512)
- `-r, --ratio` - Image scale factor
- `-b, --bearing` - Map bearing in degrees
- `-p, --pitch` - Camera pitch in degrees
- `-t, --apikey` - API key for tile services

## Development

Test the formula locally:

```bash
brew install --build-from-source ./Formula/mbgl-render.rb
```

Audit the formula:

```bash
brew audit --strict ./Formula/mbgl-render.rb
```
