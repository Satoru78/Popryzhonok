using System;
using System.Collections.Generic;
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
using WpfPoprizhonokApp.Views.Pages.MnagerPages.AgentPages;
using WpfPoprizhonokApp.Views.Pages.MnagerPages.ProductPages;

namespace WpfPoprizhonokApp.Views.Pages.MnagerPages
{
    /// <summary>
    /// Логика взаимодействия для ManagerMainPage.xaml
    /// </summary>
    public partial class ManagerMainPage : Page
    {
        public ManagerMainPage()
        {
            InitializeComponent();
        }

        private void AgentsListBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AgentDataViewPage(new Model.Agent()));
        }

        private void ApplicationBtn_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ProductBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ProductDataPage(new Model.Product()));
        }
    }
}
