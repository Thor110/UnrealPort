namespace UnrealPort
{
    partial class Open
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            gameBox = new ComboBox();
            progressBar1 = new ProgressBar();
            SuspendLayout();
            // 
            // gameBox
            // 
            gameBox.FormattingEnabled = true;
            gameBox.Location = new Point(474, 12);
            gameBox.Name = "gameBox";
            gameBox.Size = new Size(314, 23);
            gameBox.TabIndex = 0;
            gameBox.SelectedIndexChanged += gameBox_SelectedIndexChanged;
            // 
            // progressBar1
            // 
            progressBar1.Location = new Point(12, 415);
            progressBar1.Name = "progressBar1";
            progressBar1.Size = new Size(776, 23);
            progressBar1.TabIndex = 1;
            // 
            // Open
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(progressBar1);
            Controls.Add(gameBox);
            Name = "Open";
            Text = "Form1";
            ResumeLayout(false);
        }

        #endregion

        private ComboBox gameBox;
        private ProgressBar progressBar1;
    }
}
