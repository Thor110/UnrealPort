namespace UnrealPort
{
    public partial class Open : Form
    {
        private ToolTip tooltip = new ToolTip();
        private Dictionary<int, (string game, string description, string script, float zScale, bool requiresFFMPEG, bool UT2004Required)>
            compatibleGames = new Dictionary<int, (
                string game,            // the name of the game
                string description,     // a description for the game
                string script,          // tailor made batch script for converting the game
                float zScale,           // zScale and specifics unique to each game
                bool requiresFFMPEG,    // does conversion require FFMPEG
                bool UT2004Required     // does conversion require UT2004
                )>
        {
            { 0, ("Star Wars Republic Commando", ".", "swrc.bat", 0.0f, false, false) },
            { 1, ("Stargate SG-1 : The Alliance", ".", "stargate.bat", 0.0f, true, true) },
            { 2, ("Red Orchestra", ".", "red-orchestra.bat", 0.0f, false, false) },
            { 3, ("Postal 2", ".", "postal2.bat", 0.0f, false, false) },
            { 4, ("Swat 4", ".", "swat4.bat", 0.0f, false, false) },
            { 5, ("Unreal Tournament 2004", ".", "ut2004.bat", 0.0f, false, false) }
        };
        private string IniPath = "unrealport.ini";
        private IniFile iniFile;
        private string EditorPath = "";
        public Open()
        {
            InitializeComponent();
            ToolTipHelper.EnableTooltips(this.Controls, tooltip, new Type[] { typeof(Label), typeof(ProgressBar) });
            foreach (var range in compatibleGames.Values) { gameBox.Items.Add(range.game); }
            iniFile = new IniFile($"{IniPath}");
            if (!Directory.GetCurrentDirectory().Contains(IniPath)) { DefaultINI(); }
            else
            {
                // anything else???
            }
            ReadINI();
        }
        private void DefaultINI() // create default ini
        {
            // etc...
        }
        private void ReadINI() // read existing ini
        {
            EditorPath = iniFile.Read("Editor", "Game");
        }
        private void gameBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            //MessageBox.Show(gameBox.SelectedIndex.ToString());
            //MessageBox.Show(compatibleGames[gameBox.SelectedIndex].game);
        }
    }
}
