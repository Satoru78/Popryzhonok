using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfPoprizhonokApp.Context;
using WpfPoprizhonokApp.Model;

namespace WpfPoprizhonokApp.Views.Pages.MnagerPages.AgentPages
{
    /// <summary>
    /// Логика взаимодействия для AgentActionPage.xaml
    /// </summary>
    public partial class AgentActionPage : Page
    {
        public List<AgentType> AgentTypes { get; set; }
        public Agent Agent { get; set; }
        public AgentActionPage(Agent agent)
        {
            InitializeComponent();
            AgentTypes = Data.pe.AgentType.ToList();   
            Agent = agent;
            this.DataContext = this;
        }

        private void AgentDataSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (Agent.ID == 0)
                {
                    Agent.GetLogotype = "\\agents\\" + System.IO.Path.GetFileName(file.FileName);
                    Data.pe.Agent.Add(Agent);
                }
                File.Copy(file.FileName, $"agents\\{System.IO.Path.GetFileName(file.FileName).Trim()}", true);
                Agent.GetLogotype = "\\agents\\" + System.IO.Path.GetFileName(file.FileName);
                Data.pe.SaveChanges();
                MessageBox.Show("Данные сохранены", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                NavigationService.GoBack();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }
        OpenFileDialog file = new OpenFileDialog();
    

        private void SelectLogotype_Click(object sender, RoutedEventArgs e)
        {
            file.Filter = "Image (*.jpg;*.jpeg;*.png;) |  *.jpg; *.jpeg; *.png";
            if (file.ShowDialog() == true)
            {
                BitmapImage image = new BitmapImage(new Uri(file.FileName));
                Img.Source = image;
            }
        }

        private void Backbtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
