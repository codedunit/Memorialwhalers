# Memorial West Hockey - Official Website

A professional website for Memorial West Hockey, a high school varsity team with a strong presence in Houston and Texas for over a decade.

## 🏒 About

Memorial West Hockey competes in the ISHL (Interscholastic Hockey League) and excels both on the ice and in the classroom. The team has achieved multiple championships and maintains high academic standards.

## 📁 Project Structure

```
Memorial West/
├── 📄 HTML Pages
│   ├── index.html              # Homepage
│   ├── roster.html             # Team roster and coaching staff
│   ├── stats.html              # Live team statistics and performance
│   ├── sponsorships.html       # Sponsorship opportunities
│   ├── achievements.html       # Team achievements and awards
│   └── contact.html            # Contact information and form
├── 🖼️ images/                  # All image assets
│   ├── memorialwestlogo.png    # Team logo
│   ├── CoachesHeadshots.png    # Coaching staff photos
│   ├── CityChampTrophy1.png   # Championship trophy
│   ├── citychampteamphoto.jpg # Team photo
│   ├── IMG_1883.png           # Player photos
│   ├── IMG_1883Edit.png       # Player photos
│   ├── ratio4x3_1920.jpg      # Background images
│   ├── statechampteamphoto.jpg # State championship photo
│   └── Citychamphandshake.jpg # Championship celebration
├── 📚 documents/               # PDF documents
│   ├── MemorialSv1.pdf        # Memorial information
│   └── MemorialWestSponsor.pdf # Sponsorship details
├── 🎨 css/                     # Stylesheets
│   └── styles.css             # Main stylesheet
├── ⚙️ js/                      # JavaScript and Python files
│   ├── script.js              # Main JavaScript
│   ├── server.py              # Python server
│   ├── stats_scraper.py       # Live stats scraper
│   ├── requirements.txt       # Python dependencies
│   └── REAL_SCRAPING_GUIDE.md # Web scraping implementation guide
├── 🚀 setup_stats.sh          # Stats system setup script
└── 📖 README.md               # This file
```

## 🏆 Team Information

### Coaching Staff
- **Coach Taylor** - Head Coach (far right in photo)
- **Coach Tommy** - Assistant Coach (middle)
- **Coach Spencer** - Assistant Coach (far left)

### Key Players
- **Nathan Horn** (#23) - Forward, Offensive Player of the Year
- **Ryan Valdivieso** (#1) - Goalie, Goalie of the Year '24
- **Maddox Sebastian** (#14) - Forward, Rookie of the Year '24

## 🎯 Features

- **Responsive Design** - Works on all devices
- **Modern Navigation** - Fixed top bar with backdrop blur
- **Uniform Styling** - Consistent design across all pages
- **Interactive Elements** - Hover effects and animations
- **Professional Layout** - Clean, modern hockey website design
- **Live Stats System** - Real-time team performance data
- **Automatic Updates** - Stats refresh every 5 minutes
- **API Integration** - Clean data interface for your website

## 🚀 Getting Started

### Basic Setup
1. **Clone or download** the project files
2. **Open** `index.html` in your web browser
3. **Navigate** between pages using the top navigation bar
4. **Test locally** by running `python3 -m http.server 8000`

### Live Stats Setup
1. **Install Python dependencies**:
   ```bash
   ./setup_stats.sh
   ```

2. **Start the stats server**:
   ```bash
   cd js
   python3 stats_scraper.py
   ```

3. **Access live stats**:
   - **API**: `http://localhost:5000/api/stats`
   - **Stats Page**: `http://localhost:5000`
   - **Your Website**: The stats.html page will automatically fetch live data

## 📊 Live Stats System

The website includes a sophisticated live stats system that:

- **Automatically scrapes** data from ISHL league websites
- **Updates every 5 minutes** to keep stats current
- **Caches data locally** to reduce server load
- **Provides a clean API** for your website to consume
- **Handles errors gracefully** with fallback data
- **Respects rate limits** to be a good web citizen

### What Gets Updated Automatically:
- ✅ **Team Record** (Wins, Losses, Ties, Points)
- ✅ **Game Results** (Recent scores and outcomes)
- ✅ **Upcoming Games** (Schedule and venues)
- ✅ **Team Statistics** (Goals, power play, penalty kill)
- ✅ **Individual Leaders** (Top scorers, goalies)

### Implementation Options:
1. **Web Scraping** (Recommended) - Pulls data from league websites
2. **API Integration** - If your league provides official APIs
3. **Manual Updates** - Admin panel for full control

## 🎨 Design System

- **Primary Color**: #22c55e (Green)
- **Background**: #000 (Black)
- **Text**: #fff (White)
- **Accent**: #a3a3a3 (Light Gray)
- **Font**: Inter (Google Fonts)

## 📱 Responsive Breakpoints

- **Desktop**: 1200px+
- **Tablet**: 768px - 1199px
- **Mobile**: < 768px

## 🔧 Technical Details

- **HTML5** - Semantic markup
- **CSS3** - Modern styling with flexbox and grid
- **JavaScript** - Interactive functionality
- **Python** - Stats scraping and API server
- **Flask** - Web framework for stats API
- **BeautifulSoup** - HTML parsing for web scraping
- **No external dependencies** - Self-contained project

## 📊 Stats Integration

To integrate live stats with your league website:

1. **Identify your league's stats URL** (e.g., `https://ishl.org/standings`)
2. **Inspect the HTML structure** to understand how data is displayed
3. **Update the scraper** in `js/stats_scraper.py` with your specific selectors
4. **Test the integration** using the provided setup script
5. **Deploy to production** with automatic updates

See `js/REAL_SCRAPING_GUIDE.md` for detailed implementation instructions.

## 📞 Contact

For more information about Memorial West Hockey:
- **Email**: info@memorialwesthockey.com
- **Phone**: (713) 555-0123
- **Location**: Memorial Ice Complex, Houston, TX

## 📄 License

This project is for Memorial West Hockey use only.

---

*Built with ❤️ for the Memorial West Hockey community*
