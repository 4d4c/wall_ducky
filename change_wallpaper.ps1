$image_url = "https://i.imgur.com/nomJydI.jpg"
$image_path = "C:\Users\Public\Pictures\wallpaper.jpg"
if (!(Test-Path $image_path)) {
    (New-Object System.Net.WebClient).DownloadFile($image_url, $image_path)
    if (!(Test-Path $image_path)) {
        exit
    }
}
$setwallpapersrc = @"
    using System.Runtime.InteropServices;
    public class wallpaper {
        public const int SetDesktopWallpaper = 20;
        public const int UpdateIniFile = 0x01;
        public const int SendWinIniChange = 0x02;
        [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
        private static extern int SystemParametersInfo (int uAction, int uParam, string lpvParam, int fuWinIni);
        public static void SetWallpaper ( string path ) {
            SystemParametersInfo( SetDesktopWallpaper, 0, path, UpdateIniFile | SendWinIniChange );
        }
    }
"@
Add-Type -TypeDefinition $setwallpapersrc
[wallpaper]::SetWallpaper($image_path)
