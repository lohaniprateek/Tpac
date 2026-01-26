// Waybar Peek - Auto-hide for Hyprland ( Multi-monitor)
// shows Waybar when cursor is tat the edge, hides when workspace has windows.
// Toggle auto-hide: pkill -Hup -f waybar_peek
package main

//	"encoding/json"
//	"os"
//	"os/signal"
//	"time"
//	"path/filepath"

// Configuration
var (
	PIXEL_THRESHOLD      int     = 5   // Show bar when within 5px of top
	PIXEL_THRESHOLD_HIDE int     = 50  // Hide when cursor goes below 50px
	PULL_INTERVAL        float32 = 0.1 // Poll every 100ms
)

func main() {
}
