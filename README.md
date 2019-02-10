Download [Invoke-Obfuscation](https://github.com/danielbohannon/Invoke-Obfuscation).

Import Invoke-Obfuscation:
```
Import-Module .\Invoke-Obfuscation.psd1
```

Obfuscate payload:
```
Invoke-Obfuscation -ScriptPath 'C:\change_wallpaper.ps1' -Command 'String\3,String\1,String\2,Encoding\3,out C:\obf_change_wallpaper.ps1' -Quiet
```

Create RB payload:
```
java -jar duckencoder.jar -i wall_ducky.txt -o inject.bin -l gb
```
