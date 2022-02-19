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
using WpfPoprizhonokApp.Context;
using WpfPoprizhonokApp.Model;

namespace WpfPoprizhonokApp.Views.Pages.MnagerPages.AgentPages
{
    /// <summary>
    /// Логика взаимодействия для AgentDataViewPage.xaml
    /// </summary>
    public partial class AgentDataViewPage : Page
    {
        public AgentType AgentType { get; set; }
        public Agent Agent { get; set; }
        public AgentDataViewPage(Agent agent)
        {
            InitializeComponent();
            Agent = agent;
            this.DataContext = this;
        }

        private void AgentSearchTxb_SelectionChanged(object sender, RoutedEventArgs e)
        {
            var data = Data.pe.Agent.Where(item => item.Title.Contains(AgentSearchTxb.Text)
            || item.Adress.Contains(AgentSearchTxb.Text)
            || item.Phone.ToString().Contains(AgentSearchTxb.Text)).ToList();
            if (data.Any())
            {
                AgentListView.Visibility = Visibility.Visible;
                NoAgents.Visibility = Visibility.Collapsed;
                AgentListView.ItemsSource = data;
            }
            else
            {
                AgentListView.Visibility = Visibility.Collapsed;
                NoAgents.Visibility = Visibility.Visible;
            }
        }

        private void AgentTypeCmb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SearchType((AgentTypeCmb.SelectedItem as ComboBoxItem).Content.ToString(), AgentTypeCmb.Text);
        }

        private void SearchType(string type = "", string search = "")
        {
            var agents = Data.pe.Agent.ToList();
            if (!string.IsNullOrEmpty(type) && !string.IsNullOrEmpty(type))
            {
                if (type == "МФО")
                {
                    agents = agents.Where(item => item.AgentType.Title == "МФО").ToList();
                }
                if (type == "ОАО")
                {
                    agents = agents.Where(item => item.AgentType.Title == "ОАО").ToList();
                }
                if (type == "ООО")
                {
                    agents = agents.Where(item => item.AgentType.Title == "ООО").ToList();
                }
                if (type == "ЗАО")
                {
                    agents = agents.Where(item => item.AgentType.Title == "ЗАО").ToList();
                }
                if (type == "ПАО")
                {
                    agents = agents.Where(item => item.AgentType.Title == "ПАО").ToList();
                }
                if (type == "МКК")
                {
                    agents = agents.Where(item => item.AgentType.Title == "МКК").ToList();
                }
                if (type == "Все")
                {
                    agents = agents.ToList();
                }
            }
            AgentListView.ItemsSource = agents;
        }

        private void AgentBackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void AgentAddBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AgentActionPage(new Agent()));
        }

        private void AgentEditBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var selectedItemAgent = AgentListView.SelectedItem as Agent;
                if (selectedItemAgent != null)
                    NavigationService.Navigate(new AgentActionPage(selectedItemAgent));
                else
                    throw new Exception("Пожалуйста, выберите объект из списка!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void AgentDeleteBtn_Click(object sender, RoutedEventArgs e)
        {
            var selectedItemAgent = AgentListView.SelectedItem as Agent;
            if (selectedItemAgent != null)
            {
                if (MessageBox.Show("Вы дествительно хотите удалить данные?", "Данные будут удалены навсегда!", MessageBoxButton.OKCancel, MessageBoxImage.Warning) == MessageBoxResult.OK)
                {
                    Data.pe.Agent.Remove(selectedItemAgent);
                    Data.pe.SaveChanges();
                    MessageBox.Show("Данные успешно удалены", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                    Page_Loaded(null, null);
                }

            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            AgentListView.ItemsSource = Data.pe.Agent.ToList();
        }

        private void AgentDataBackBtn_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
