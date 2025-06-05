# NICC Embed Widget

A lightweight, embeddable version of NICC (ADAS Calibration Assistant) that can be integrated into any website as a floating widget.

## Features

- **VIN Decoding**: Automatic vehicle identification using NHTSA API
- **Manual Vehicle Selection**: Year, Make, Model dropdowns
- **Calibration Lookup**: Search ADAS calibration procedures
- **Responsive Design**: Works on desktop and mobile
- **Easy Integration**: Simple script tag integration

## Quick Start

### 1. Start the Widget Server

```bash
cd nicc-embed
pip install -r requirements.txt
python app.py
```

The widget server will start on `http://localhost:5001`

### 2. Embed in Your Website

Add this script tag to your HTML page:

```html
<script src="http://localhost:5001/embed.js" data-auto-init></script>
```

That's it! The widget will automatically appear as a floating button.

## Advanced Integration

### Manual Initialization

```html
<script src="http://localhost:5001/embed.js"></script>
<script>
// Initialize with custom options
NICCWidget.init({
    position: 'bottom-right',     // bottom-right, bottom-left, top-right, top-left
    buttonText: 'ADAS Help',      // Custom button text
    buttonColor: '#2196F3',       // Custom button color
    width: '400px',               // Widget width
    height: '600px'               // Widget height
});
</script>
```

### Programmatic Control

```javascript
// Open widget
NICCWidget.open();

// Close widget
NICCWidget.close();

// Toggle widget
NICCWidget.toggle();
```

## Configuration Options

| Option | Default | Description |
|--------|---------|-------------|
| `position` | `'bottom-right'` | Widget position: `bottom-right`, `bottom-left`, `top-right`, `top-left` |
| `buttonText` | `'ADAS Help'` | Text displayed on the floating button |
| `buttonColor` | `'#2196F3'` | Background color of the floating button |
| `zIndex` | `999999` | CSS z-index for the widget |
| `width` | `'400px'` | Width of the widget popup |
| `height` | `'600px'` | Height of the widget popup |

## Production Deployment

### 1. Update Host Configuration

In production, update the `NICC_HOST` variable in `templates/embed.js`:

```javascript
const NICC_HOST = 'your-domain.com:5001';
```

### 2. HTTPS Setup

For production use, ensure the widget server runs with HTTPS:

```python
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, ssl_context='adhoc')
```

### 3. CORS Configuration

The widget includes CORS headers to allow embedding on external domains. Modify `app.py` if you need to restrict to specific domains:

```python
from flask_cors import CORS
CORS(app, origins=['https://your-allowed-domain.com'])
```

## Integration Examples

### Basic Integration
```html
<!DOCTYPE html>
<html>
<head>
    <title>My Website</title>
</head>
<body>
    <h1>Welcome to My Site</h1>
    
    <!-- NICC Widget -->
    <script src="http://localhost:5001/embed.js" data-auto-init></script>
</body>
</html>
```

### Custom Styling
```html
<script src="http://localhost:5001/embed.js"></script>
<script>
NICCWidget.init({
    position: 'bottom-left',
    buttonText: 'Vehicle Help',
    buttonColor: '#ff6b35',
    width: '450px',
    height: '650px'
});
</script>
```

### WordPress Integration

Add this to your theme's `functions.php`:

```php
function add_nicc_widget() {
    echo '<script src="http://localhost:5001/embed.js" data-auto-init></script>';
}
add_action('wp_footer', 'add_nicc_widget');
```

## Customization

### Styling

The widget uses isolated CSS and won't interfere with your site's styles. However, you can customize the floating button by targeting:

```css
#nicc-widget-button {
    /* Your custom styles */
}
```

### API Endpoints

The widget provides these API endpoints:

- `GET /` - Widget interface
- `GET /embed.js` - Embed script
- `POST /api/vin-decode` - VIN decoding
- `POST /api/vehicle-search` - Vehicle search
- `GET /api/makes` - Available makes
- `GET /api/models?make=X` - Models for make

## Browser Support

- Chrome 60+
- Firefox 55+
- Safari 12+
- Edge 79+

## Security Considerations

- The widget loads in an iframe for security isolation
- CORS is configured to allow embedding
- All API calls use HTTPS in production
- No sensitive data is stored client-side

## Troubleshooting

### Widget Not Appearing
1. Check console for JavaScript errors
2. Verify the embed script URL is accessible
3. Ensure CORS is properly configured

### VIN Decoding Issues
1. Check internet connectivity
2. Verify NHTSA API is accessible
3. Ensure VIN format is correct (17 characters)

### Database Connection Issues
1. Verify `NiccDB.db` exists in parent directory
2. Check database file permissions
3. Ensure SQLite is properly installed

## Support

For issues or questions about the NICC Embed Widget, please contact the development team.

## License

This software is proprietary and confidential. Unauthorized copying, distribution, or use is strictly prohibited. 