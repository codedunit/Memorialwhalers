# 🏒 Real Web Scraping Implementation Guide

This guide will help you implement real web scraping from the ISHL (Interscholastic Hockey League) website to get live stats for Memorial West Hockey.

## 🎯 **What We're Building**

A system that automatically:
- ✅ Scrapes live stats from ISHL website
- ✅ Updates your website in real-time
- ✅ Caches data to avoid overwhelming the league site
- ✅ Provides a clean API for your website
- ✅ Updates every 5 minutes automatically

## 🔧 **Step 1: Find Your League Website**

First, you need to identify the exact URL where your team's stats are published. Common locations:

- **ISHL Main Site**: `https://ishl.org/standings` or similar
- **League Stats**: `https://ishl.org/teams/memorial-west` or similar
- **Standings Page**: `https://ishl.org/standings/division-name`
- **Team Page**: `https://ishl.org/teams/memorial-west/stats`

## 🔍 **Step 2: Inspect the Website**

1. **Open your league website** in Chrome/Firefox
2. **Right-click** on the stats table and select "Inspect Element"
3. **Look for patterns** in the HTML structure:
   - Table rows with team names
   - Win/loss/ties in specific columns
   - Points calculations
   - Game results

## 📝 **Step 3: Update the Scraper**

Replace the `get_mock_stats()` function in `stats_scraper.py` with real scraping:

```python
def scrape_ishl_stats(self):
    """Scrape real stats from ISHL website"""
    try:
        # Replace with your actual ISHL URL
        url = "https://ishl.org/standings"  # UPDATE THIS
        
        # Send request to the website
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
        }
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()
        
        # Parse the HTML
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Find your team's row in the standings table
        # You'll need to customize this based on the actual HTML structure
        team_row = soup.find('tr', string=lambda text: text and 'Memorial West' in text)
        
        if not team_row:
            # Alternative: search for team name in any element
            team_element = soup.find(string=lambda text: text and 'Memorial West' in text)
            if team_element:
                team_row = team_element.find_parent('tr')
        
        if team_row:
            # Extract stats from the row
            stats = self.extract_stats_from_row(team_row)
            return stats
        else:
            print("Could not find Memorial West in standings")
            return self.get_mock_stats()  # Fallback to mock data
            
    except Exception as e:
        print(f"Error scraping ISHL: {e}")
        return self.load_cache()  # Return cached data if available

def extract_stats_from_row(self, row):
    """Extract stats from a standings table row"""
    try:
        # You'll need to customize these selectors based on the actual HTML
        cells = row.find_all('td')
        
        # Example structure (adjust based on actual website):
        wins = int(cells[1].text.strip()) if len(cells) > 1 else 0
        losses = int(cells[2].text.strip()) if len(cells) > 2 else 0
        ties = int(cells[3].text.strip()) if len(cells) > 3 else 0
        points = int(cells[4].text.strip()) if len(cells) > 4 else 0
        
        return {
            "team": "Memorial West",
            "last_updated": datetime.now().isoformat(),
            "season": "2024-2025",
            "league": "ISHL",
            "overall_record": {
                "wins": wins,
                "losses": losses,
                "ties": ties,
                "points": points
            },
            # ... rest of the stats structure
        }
    except Exception as e:
        print(f"Error extracting stats: {e}")
        return self.get_mock_stats()
```

## 🎨 **Step 4: Customize for Your League's HTML Structure**

The key is understanding how your league website displays data. Here are common patterns:

### **Table Structure Example:**
```html
<table class="standings">
  <tr>
    <td>Memorial West</td>
    <td>15</td>  <!-- Wins -->
    <td>3</td>   <!-- Losses -->
    <td>2</td>   <!-- Ties -->
    <td>32</td>  <!-- Points -->
  </tr>
</table>
```

### **List Structure Example:**
```html
<div class="team-stats">
  <div class="team-name">Memorial West</div>
  <div class="record">15-3-2</div>
  <div class="points">32</div>
</div>
```

## 🚀 **Step 5: Test Your Scraper**

1. **Run the setup script**:
   ```bash
   ./setup_stats.sh
   ```

2. **Check the API endpoint**:
   ```bash
   curl http://localhost:5000/api/stats
   ```

3. **View the stats page**:
   Open `http://localhost:5000` in your browser

## 🔄 **Step 6: Schedule Automatic Updates**

### **Option A: Cron Job (Linux/Mac)**
```bash
# Edit crontab
crontab -e

# Add this line to run every 5 minutes
*/5 * * * * cd /path/to/your/project/js && python3 stats_scraper.py
```

### **Option B: Windows Task Scheduler**
1. Open Task Scheduler
2. Create Basic Task
3. Set trigger to every 5 minutes
4. Set action to run `python3 stats_scraper.py`

### **Option C: Keep Server Running**
```bash
# Run in background
nohup python3 stats_scraper.py > stats.log 2>&1 &

# Check if running
ps aux | grep stats_scraper
```

## 🛡️ **Step 7: Be a Good Web Citizen**

- **Respect robots.txt**: Check if the league site has one
- **Rate limiting**: Don't scrape more than once every 5 minutes
- **User-Agent**: Use a descriptive user agent string
- **Error handling**: Gracefully handle website changes
- **Caching**: Store data locally to reduce server load

## 🔧 **Step 8: Handle Website Changes**

League websites change frequently. Make your scraper robust:

```python
def scrape_with_fallback(self):
    """Try multiple scraping methods"""
    methods = [
        self.scrape_method_1,  # Primary method
        self.scrape_method_2,  # Backup method
        self.scrape_method_3   # Emergency fallback
    ]
    
    for method in methods:
        try:
            result = method()
            if result:
                return result
        except Exception as e:
            print(f"Method {method.__name__} failed: {e}")
            continue
    
    return self.load_cache()  # Return cached data
```

## 📊 **Step 9: Add More Data Sources**

Consider scraping multiple sources for comprehensive stats:

- **League standings** for win/loss records
- **Team page** for individual player stats
- **Schedule page** for upcoming games
- **News page** for team updates

## 🚨 **Troubleshooting Common Issues**

### **"Connection refused" error**
- Check if the league website is accessible
- Verify the URL is correct
- Check your internet connection

### **"Element not found" error**
- The website HTML structure changed
- Update your selectors
- Use browser dev tools to inspect new structure

### **"Rate limited" error**
- League website is blocking frequent requests
- Increase delay between requests
- Use a proxy rotation (advanced)

## 📱 **Step 10: Integrate with Your Website**

Your website now automatically fetches live stats:

```javascript
// The stats.html page automatically calls:
fetch('http://localhost:5000/api/stats')
  .then(response => response.json())
  .then(data => {
    // Update your website with live data
    updateTeamRecord(data.overall_record);
    updateRecentGames(data.recent_games);
    updateUpcomingGames(data.upcoming_games);
  });
```

## 🎉 **You're Done!**

Your Memorial West Hockey website now has:
- ✅ **Live stats** that update automatically
- ✅ **Real-time game results** from ISHL
- ✅ **Professional appearance** with current data
- ✅ **Low maintenance** - runs automatically
- ✅ **Scalable system** - easy to add more data

## 📞 **Need Help?**

If you run into issues:
1. Check the browser console for JavaScript errors
2. Check the Python console for scraping errors
3. Verify the league website is accessible
4. Test the API endpoint manually

Your website will now automatically stay up-to-date with the latest Memorial West Hockey performance data! 🏒
