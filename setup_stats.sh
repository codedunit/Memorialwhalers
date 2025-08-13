#!/bin/bash

echo "🏒 Memorial West Hockey Stats Setup 🏒"
echo "======================================"
echo ""

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3.8 or higher."
    exit 1
fi

echo "✅ Python 3 found: $(python3 --version)"

# Check if pip is installed
if ! command -v pip3 &> /dev/null; then
    echo "❌ pip3 is not installed. Please install pip3."
    exit 1
fi

echo "✅ pip3 found: $(pip3 --version)"

# Install Python dependencies
echo ""
echo "📦 Installing Python dependencies..."
cd js
pip3 install -r requirements.txt

if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed successfully!"
else
    echo "❌ Failed to install dependencies. Please check the error above."
    exit 1
fi

echo ""
echo "🚀 Starting the stats server..."
echo "📊 Stats API will be available at: http://localhost:5000/api/stats"
echo "🌐 Stats page will be available at: http://localhost:5000"
echo "📱 Your website can now fetch live stats from: http://localhost:5000/api/stats"
echo ""
echo "💡 To stop the server, press Ctrl+C"
echo "💡 To run this in the background, use: nohup python3 stats_scraper.py &"
echo ""

# Start the stats server
python3 stats_scraper.py
