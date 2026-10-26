# Distraction_Lock

Distraction_Lock is a tool for Arch Linux that blocks distracting domains by redirecting them to an invalid address , and also logs every attempt in a SQLite db.

## Requirements
-Arch Linux (or any distros with systemd)
-Bash
-Python 3
-SQLite

## Installation

Clone the repo
```bash
chmod +x blocker.sh deblocker.sh
python init_db.py
```

## Usage

How to block
```bash
sudo ./blocker.sh
```
How to unblock
```bash
sudo ./deblocker.sh
```
How to see the stats
```bash
python3 stats.py
```
How to lauch the systemd service
```bash
sudo systemctl start blocker.service
```

```python

```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.


## License

[Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0.html)
