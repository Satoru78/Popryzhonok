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
    /// Логика взаимодействия для ProductDataPage.xaml
    /// </summary>
    public partial class ProductDataPage : Page
    {
        public ProductType ProductType { get; set; }
        public Product Product { get; set; }
        public ProductDataPage(Product product)
        {
            InitializeComponent();
            Product = product;
            this.DataContext = this;
        }

        private void ProductSearchTxb_SelectionChanged(object sender, RoutedEventArgs e)
        {
            var list = Data.pe.Product.Where(item => item.Title.Contains(ProductSearchTxb.Text) ||
            item.ProductType.Title.Contains(ProductSearchTxb.Text) || item.Cost.ToString().Contains(ProductSearchTxb.Text)
            || item.Articul.ToString().Contains(ProductSearchTxb.Text)).ToList();

            if (list.Any())
            {
                ProductData.Visibility = Visibility.Visible;
                NoProduct.Visibility = Visibility.Collapsed;
                ProductData.ItemsSource = list;
            }
            else
            {
                ProductData.Visibility = Visibility.Collapsed;
                NoProduct.Visibility = Visibility.Visible;
            }
        }

        private void DeleteProductBtn_Click(object sender, RoutedEventArgs e)
        {
            var selectedItemProduct = ProductData.SelectedItem as Product;
            if (selectedItemProduct != null)
            {
                if (MessageBox.Show("Вы дествительно хотите удалить данные?", "Данные будут удалены навсегда!", MessageBoxButton.OKCancel, MessageBoxImage.Warning) == MessageBoxResult.OK)
                {
                    Data.pe.Product.Remove(selectedItemProduct);
                    Data.pe.SaveChanges();
                }
                    MessageBox.Show("Данные успешно удалены", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                    Page_Loaded(null, null);

            }
            else
                throw new Exception("Пожалуйста, выберите объект из списка!");
        }

        private void EditProductBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var selectedItemProduct = ProductData.SelectedItem as Product;
                if (selectedItemProduct != null)
                    NavigationService.Navigate(new ProductActionPage(selectedItemProduct));
                else
                    throw new Exception("Пожалуйста, выберите объект из списка!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void AddProductBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ProductActionPage(new Product()));
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            ProductData.ItemsSource = Data.pe.Product.ToList();
        }

        private void ProductBackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
