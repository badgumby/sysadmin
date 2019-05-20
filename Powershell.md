# Powershell Scriptlets

### Convert bitwise mask to day of week

> Build the table

```
# Bitwise weekday table
[flags()] Enum DayTable
{
  Sunday = 0x01    # 1
  Monday = 0x02    # 2
  Tuesday = 0x04   # 4
  Wednesday = 0x08 # 8
  Thursday = 0x10  # 16
  Friday = 0x20    # 32
  Saturday = 0x40  # 64
}

```

> Now you can call on a decimal value to show the days of the week

```
PS C:\> [DayTable]62
Monday, Tuesday, Wednesday, Thursday, Friday
```
