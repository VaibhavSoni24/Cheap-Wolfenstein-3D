# Cheap Wolfenstein 3D

A simplified 3D first-person shooter (FPS) game built with **Godot Engine 4.4**, inspired by the classic Wolfenstein 3D. Fight through enemy-filled corridors, pick up weapons and health packs, and advance through multiple levels.

## Screenshot

> *Run the project in Godot to see it in action.*

## Features

- First-person 3D gameplay with mouse-look camera
- Four weapons: Knife, Pistol, Rifle, and Mini Gun — each with different fire rates
- Enemy AI guards that chase and attack the player
- Health packs and ammo pickups
- Openable doors
- Multi-level progression (2 levels)
- HUD showing health, ammo, lives, score, and level

## Requirements

- [Godot Engine 4.4](https://godotengine.org/download/)

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/VaibhavSoni24/Cheap-Wolfenstein-3D.git
   ```
2. Open **Godot Engine 4.4**.
3. Click **Import** and select the project folder.
4. Press **F5** (or click the **Run** button) to play.

## Controls

| Action        | Key / Input          |
|---------------|----------------------|
| Move Forward  | W / ↑                |
| Move Backward | S / ↓                |
| Strafe Left   | A / ←                |
| Strafe Right  | D / →                |
| Jump          | Space                |
| Shoot / Attack| Left Mouse Button    |
| Interact (Door)| E                   |
| Look          | Mouse movement       |
| Quit          | Esc                  |

## Weapons

| Weapon      | Type   | Fire Rate     | Ammo Required |
|-------------|--------|---------------|---------------|
| Knife       | Melee  | 2 swings/sec  | No            |
| Pistol      | Ranged | 3 shots/sec   | Yes           |
| Rifle       | Ranged | 6 shots/sec   | Yes           |
| Mini Gun    | Ranged | 10 shots/sec  | Yes           |

Weapons are picked up automatically. When ammo runs out, the player falls back to the knife.

## Building an Executable

The project includes export presets for **Windows x86_64**:

1. In the Godot editor, go to **Project → Export**.
2. Select the *Windows Desktop* preset.
3. Click **Export Project** — the output file is `FPS.exe`.

## Project Structure

```
Cheap-Wolfenstein-3D/
├── Assets/          # Sprites and audio files
├── Textures/        # Wall and floor textures
├── *.gd             # GDScript source files
├── *.tscn           # Godot scene files
└── project.godot    # Godot project configuration
```

## License

This project does not currently include a license file. Please contact the repository owner for usage terms.
