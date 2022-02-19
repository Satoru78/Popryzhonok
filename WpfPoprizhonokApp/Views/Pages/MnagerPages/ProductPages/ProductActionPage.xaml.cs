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

namespace WpfPoprizhonokApp.Views.Pages.MnagerPages.ProductPages
{
    /// <summary>
    /// Логика взаимодействия для ProductActionPage.xaml
    /// </summary>
    public partial class ProductActionPage : Page
    {
        public List<ProductType> ProductTypes { get; set; }
        public Product Product { get; set; }
        public ProductActionPage(Product product)
        {
            InitializeComponent();
            ProductTypes = Data.pe.ProductType.ToList();
            Product = product;
            this.DataContext = this;
        }

        private void ProductDataSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (Product.ID == 0)
                {
                    Data.pe.Product.Add(Product);
                }
                Data.pe.SaveChanges();
                MessageBox.Show("Данные успешно добавлены", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                NavigationService.GoBack();
                GC.Collect();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void ProActBackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
