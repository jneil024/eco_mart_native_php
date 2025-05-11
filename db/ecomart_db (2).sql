-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2025 at 06:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomart_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cartitems`
--

CREATE TABLE `cartitems` (
  `cart_item_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_at_time` decimal(10,2) NOT NULL,
  `added_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `created_at`) VALUES
(1, 'Christmas Markets', '2025-02-13 11:33:59'),
(2, 'Watts Japan', '2025-02-13 11:33:59'),
(3, 'Promos', '2025-02-13 11:33:59'),
(4, 'Fresh Produce', '2025-02-13 11:33:59'),
(5, 'Fresh Meat & Seafood', '2025-02-13 11:33:59'),
(6, 'Frozen Goods', '2025-02-13 11:33:59'),
(7, 'Ready to Heat & Eat Items', '2025-02-13 11:33:59'),
(8, 'Ready to Cook', '2025-02-13 11:33:59'),
(9, 'Chilled & Dairy Items', '2025-02-13 11:33:59'),
(10, 'Snacks', '2025-02-13 11:33:59');

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_at_time` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL,
  `order_date` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `price`, `image_url`, `description`, `stock_quantity`, `created_at`, `updated_at`) VALUES
(1, 10, 'Lays Classic Potato Chips', 150.00, 'https://www.ubuy.com.ph/productimg/?image=aHR0cHM6Ly9pbWFnZXMtY2RuLnVidXkuY28uaW4vNjQwMmZiZjQ2MDI4OWE3ZTI5MGRmOTgzLWxheXMtcG90YXRvLWNoaXBzLWNsYXNzaWMtOC1vei5qcGc.jpg', 'Crispy and salty potato chips.', 100, '2025-02-14 15:58:56', '2025-02-17 16:06:03'),
(2, 10, 'Doritos Nacho Cheese', 180.00, 'https://i.imgur.com/kK9dJDp.jpg', 'Crunchy nacho cheese-flavored tortilla chips.', 100, '2025-02-14 15:58:56', '2025-02-16 01:38:12'),
(3, 10, 'Cheetos Crunchy', 160.00, 'https://i.imgur.com/QpG7jsm.jpg', 'Cheesy and crunchy corn snacks.', 100, '2025-02-14 15:58:56', '2025-02-16 01:38:12'),
(4, 10, 'Pringles Original', 200.00, 'https://i.imgur.com/w6CqATP.jpg', 'Stackable potato chips.', 100, '2025-02-14 15:58:56', '2025-02-16 01:38:12'),
(5, 10, 'Oreo Cookies', 120.00, 'https://i.imgur.com/0alqO4v.jpg', 'Chocolate sandwich cookies with vanilla cream.', 100, '2025-02-14 15:58:56', '2025-02-16 01:38:12'),
(6, 10, 'KitKat Bar', 55.00, 'https://i.imgur.com/vLZS0r3.jpg', 'Crispy wafer covered in chocolate.', 100, '2025-02-14 15:58:56', '2025-02-16 01:38:12'),
(7, 10, 'Hershey’s Milk Chocolate', 75.00, NULL, 'Smooth milk chocolate bar.', 100, '2025-02-14 15:58:56', '2025-02-16 01:18:56'),
(8, 10, 'Snickers Bar', 65.00, 'https://i.imgur.com/7Ac68DQ.jpg', 'Peanuts, caramel, nougat, and chocolate.', 100, '2025-02-14 15:58:56', '2025-02-16 01:38:12'),
(9, 10, 'M&M’s Peanut', 100.00, NULL, 'Peanut coated in milk chocolate and candy shell.', 100, '2025-02-14 15:58:56', '2025-02-16 01:18:56'),
(10, 10, 'Twix', 55.00, 'https://i.imgur.com/aPEPZv9.jpg', 'Caramel and biscuit covered in chocolate.', 100, '2025-02-14 15:58:56', '2025-02-16 01:38:12'),
(11, 10, 'Ritz Crackers', 180.00, 'https://i.imgur.com/XzVGSJ2.jpg', 'Buttery and crispy crackers.', 100, '2025-02-14 15:58:56', '2025-02-16 01:38:12'),
(12, 10, 'Pocky Chocolate Sticks', 90.00, 'https://i.imgur.com/J5qQOw4.jpg', 'Biscuit sticks coated in chocolate.', 100, '2025-02-14 15:58:56', '2025-02-16 01:38:12'),
(13, 10, 'Takis Fuego', 200.00, 'https://i.imgur.com/2LHc6Y8.jpg', 'Spicy rolled tortilla chips.', 100, '2025-02-14 15:58:56', '2025-02-16 01:38:12'),
(14, 10, 'Planters Peanuts', 160.00, 'https://i.imgur.com/K8VXmJp.jpg', 'Salted roasted peanuts.', 100, '2025-02-14 15:58:56', '2025-02-16 01:38:12'),
(15, 10, 'Nutella & Go!', 130.00, 'https://i.imgur.com/XM2oJVg.jpg', 'Hazelnut spread with dipping sticks.', 100, '2025-02-14 15:58:56', '2025-02-16 01:38:12'),
(16, 1, 'Christmas Ham', 500.00, 'https://example.com/christmas-ham.jpg', 'Delicious Christmas ham.', 100, '2025-02-15 17:36:45', '2025-02-15 17:36:45'),
(17, 1, 'Gingerbread Cookies', 250.00, 'https://example.com/gingerbread.jpg', 'Traditional gingerbread cookies.', 100, '2025-02-15 17:36:45', '2025-02-15 17:36:45'),
(18, 1, 'Holiday Fruitcake', 300.00, 'https://example.com/fruitcake.jpg', 'Rich holiday fruitcake.', 100, '2025-02-15 17:36:45', '2025-02-15 17:36:45'),
(19, 1, 'Candy Canes', 50.00, 'https://example.com/candy-canes.jpg', 'Sweet peppermint candy canes.', 100, '2025-02-15 17:36:45', '2025-02-15 17:36:45'),
(20, 1, 'Christmas Tree Decor', 400.00, 'https://example.com/tree-decor.jpg', 'Festive decorations for your tree.', 100, '2025-02-15 17:36:45', '2025-02-15 17:36:45'),
(21, 1, 'Eggnog', 150.00, 'https://example.com/eggnog.jpg', 'Classic Christmas eggnog.', 100, '2025-02-15 17:36:45', '2025-02-15 17:36:45'),
(22, 1, 'Santa Hat', 100.00, 'https://example.com/santa-hat.jpg', 'Soft and fluffy Santa hat.', 100, '2025-02-15 17:36:45', '2025-02-15 17:36:45'),
(23, 1, 'Hot Cocoa Mix', 120.00, 'https://example.com/hot-cocoa.jpg', 'Delicious hot cocoa mix.', 100, '2025-02-15 17:36:45', '2025-02-15 17:36:45'),
(24, 1, 'Christmas Lights', 500.00, 'https://example.com/christmas-lights.jpg', 'Bright holiday lights.', 100, '2025-02-15 17:36:45', '2025-02-15 17:36:45'),
(25, 1, 'Holiday Candles', 200.00, 'https://example.com/holiday-candles.jpg', 'Scented candles for the season.', 100, '2025-02-15 17:36:45', '2025-02-15 17:36:45'),
(26, 1, 'Christmas Wrapping Paper', 100.00, 'https://example.com/wrapping-paper.jpg', 'Festive wrapping paper.', 100, '2025-02-15 17:36:45', '2025-02-15 17:36:45'),
(27, 1, 'Reindeer Plush Toy', 250.00, 'https://example.com/reindeer-plush.jpg', 'Cute reindeer plush toy.', 100, '2025-02-15 17:36:45', '2025-02-15 17:36:45'),
(28, 1, 'Holiday Greeting Cards', 80.00, 'https://example.com/greeting-cards.jpg', 'Beautiful holiday greeting cards.', 100, '2025-02-15 17:36:45', '2025-02-15 17:36:45'),
(29, 1, 'Christmas Stockings', 150.00, 'https://example.com/stockings.jpg', 'Traditional Christmas stockings.', 100, '2025-02-15 17:36:45', '2025-02-15 17:36:45'),
(30, 1, 'Christmas Wreath', 500.00, 'https://example.com/wreath.jpg', 'Beautiful holiday wreath.', 100, '2025-02-15 17:36:45', '2025-02-15 17:36:45'),
(31, 2, 'Matcha Green Tea Powder', 599.99, 'https://example.com/images/matcha.jpg', 'Premium grade Japanese matcha powder, 100g', 50, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(32, 2, 'Japanese Rice Cooker', 3999.99, 'https://example.com/images/rice-cooker.jpg', 'Advanced fuzzy logic rice cooker with multiple settings', 30, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(33, 2, 'Sake Set', 899.99, 'https://example.com/images/sake-set.jpg', 'Traditional ceramic sake set with 4 cups', 40, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(34, 2, 'Japanese Tea Set', 1299.99, 'https://example.com/images/tea-set.jpg', 'Complete traditional tea ceremony set', 25, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(35, 2, 'Sushi Making Kit', 799.99, 'https://example.com/images/sushi-kit.jpg', 'Complete sushi making kit with bamboo mat', 60, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(36, 2, 'Japanese Knife Set', 4999.99, 'https://example.com/images/knife-set.jpg', 'Professional grade Japanese kitchen knife set', 20, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(37, 2, 'Bento Box', 499.99, 'https://example.com/images/bento.jpg', 'Multi-compartment lunch box with chopsticks', 75, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(38, 2, 'Japanese Instant Ramen Pack', 299.99, 'https://example.com/images/ramen.jpg', 'Premium instant ramen variety pack', 100, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(39, 2, 'Japanese Ceramic Bowl Set', 699.99, 'https://example.com/images/bowl-set.jpg', 'Set of 4 traditional ceramic bowls', 45, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(40, 2, 'Electric Hot Pot', 2499.99, 'https://example.com/images/hot-pot.jpg', 'Japanese-style electric hot pot for shabu-shabu', 35, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(41, 2, 'Japanese Snack Box', 399.99, 'https://example.com/images/snack-box.jpg', 'Assorted Japanese snacks and treats', 80, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(42, 2, 'Bamboo Chopsticks Set', 199.99, 'https://example.com/images/chopsticks.jpg', 'Set of 5 pairs of bamboo chopsticks with rest', 90, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(43, 2, 'Japanese Green Tea Set', 449.99, 'https://example.com/images/green-tea.jpg', 'Premium green tea variety pack', 70, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(44, 2, 'Rice Paddle Set', 149.99, 'https://example.com/images/rice-paddle.jpg', 'Set of 3 rice serving paddles', 85, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(45, 2, 'Japanese Sauce Set', 349.99, 'https://example.com/images/sauce-set.jpg', 'Set of traditional Japanese cooking sauces', 65, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(46, 3, 'Bundle Deal - Breakfast Set', 499.99, 'https://example.com/images/breakfast-bundle.jpg', 'Complete breakfast bundle with cereals, bread, and spreads', 40, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(47, 3, 'Family Pack - Snacks', 399.99, 'https://example.com/images/snack-bundle.jpg', 'Assorted family-size snack package', 50, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(48, 3, 'Buy 1 Get 1 - Pasta Pack', 299.99, 'https://example.com/images/pasta-promo.jpg', 'Two premium pasta packages for the price of one', 60, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(49, 3, 'Discount Pack - Beverages', 349.99, 'https://example.com/images/beverage-pack.jpg', 'Assorted beverages at special price', 45, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(50, 3, 'Special Bundle - Asian Cuisine', 599.99, 'https://example.com/images/asian-bundle.jpg', 'Complete Asian cooking ingredients set', 35, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(51, 3, 'Value Pack - Cleaning Supplies', 449.99, 'https://example.com/images/cleaning-bundle.jpg', 'Complete household cleaning bundle', 55, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(52, 3, 'Combo Deal - Instant Meals', 399.99, 'https://example.com/images/instant-meals.jpg', 'Selection of ready-to-eat meals', 65, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(53, 3, 'Save Pack - Personal Care', 299.99, 'https://example.com/images/personal-care.jpg', 'Essential personal care items bundle', 70, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(54, 3, 'Special Offer - Baking Set', 499.99, 'https://example.com/images/baking-set.jpg', 'Complete baking ingredients package', 40, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(55, 3, 'Discount Bundle - Pet Supplies', 399.99, 'https://example.com/images/pet-bundle.jpg', 'Essential pet care products package', 50, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(56, 3, 'Value Deal - Canned Goods', 299.99, 'https://example.com/images/canned-goods.jpg', 'Assorted canned foods package', 75, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(57, 3, 'Bundle Pack - Dairy Products', 349.99, 'https://example.com/images/dairy-bundle.jpg', 'Selection of dairy products at special price', 60, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(58, 3, 'Combo Pack - Frozen Foods', 449.99, 'https://example.com/images/frozen-bundle.jpg', 'Variety of frozen foods at discount', 45, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(59, 3, 'Save Bundle - Kitchen Essentials', 599.99, 'https://example.com/images/kitchen-bundle.jpg', 'Kitchen basics package deal', 35, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(60, 3, 'Special Pack - International Foods', 499.99, 'https://example.com/images/international-bundle.jpg', 'Selection of international food products', 40, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(61, 4, 'Organic Bananas', 90.00, 'https://example.com/images/fresh-produce/bananas.jpg', 'Fresh organic bananas, sold per kg', 100, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(62, 4, 'Red Apples', 150.00, 'https://example.com/images/fresh-produce/apples.jpg', 'Crisp red apples, sold per kg', 80, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(63, 4, 'Fresh Spinach', 69.99, 'https://example.com/images/fresh-produce/spinach.jpg', 'Organic spinach leaves, per bunch', 60, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(64, 4, 'Cherry Tomatoes', 99.99, 'https://example.com/images/fresh-produce/tomatoes.jpg', 'Sweet cherry tomatoes, 250g pack', 70, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(65, 4, 'Fresh Carrots', 49.99, 'https://example.com/images/fresh-produce/carrots.jpg', 'Fresh orange carrots, per kg', 90, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(66, 4, 'Broccoli', 79.99, 'https://example.com/images/fresh-produce/broccoli.jpg', 'Fresh broccoli head, per piece', 75, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(67, 4, 'Sweet Potatoes', 69.99, 'https://example.com/images/fresh-produce/sweet-potatoes.jpg', 'Fresh sweet potatoes, per kg', 85, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(68, 4, 'Green Lettuce', 59.99, 'https://example.com/images/fresh-produce/lettuce.jpg', 'Fresh green lettuce head', 65, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(69, 4, 'Red Onions', 39.99, 'https://example.com/images/fresh-produce/red-onions.jpg', 'Fresh red onions, per kg', 95, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(70, 4, 'Green Beans', 89.99, 'https://example.com/images/fresh-produce/green-beans.jpg', 'Fresh green beans, 500g pack', 70, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(71, 4, 'Fresh Mushrooms', 129.99, 'https://example.com/images/fresh-produce/mushrooms.jpg', 'Button mushrooms, 250g pack', 60, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(72, 4, 'Cucumber', 49.99, 'https://example.com/images/fresh-produce/cucumber.jpg', 'Fresh cucumber, per piece', 80, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(73, 4, 'Bell Peppers', 79.99, 'https://example.com/images/fresh-produce/bell-peppers.jpg', 'Assorted bell peppers, per kg', 75, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(74, 4, 'Fresh Ginger', 59.99, 'https://example.com/images/fresh-produce/ginger.jpg', 'Fresh ginger root, per 100g', 85, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(75, 4, 'Fresh Garlic', 49.99, 'https://example.com/images/fresh-produce/garlic.jpg', 'Fresh garlic bulbs, per 100g', 90, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(76, 5, 'Premium Ground Beef', 299.99, 'https://example.com/images/meat/ground-beef.jpg', 'Fresh ground beef, 80% lean, per kg', 50, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(77, 5, 'Chicken Breast', 259.99, 'https://example.com/images/meat/chicken-breast.jpg', 'Boneless chicken breast, per kg', 60, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(78, 5, 'Fresh Salmon Fillet', 499.99, 'https://example.com/images/seafood/salmon.jpg', 'Atlantic salmon fillet, per kg', 40, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(79, 5, 'Pork Chops', 279.99, 'https://example.com/images/meat/pork-chops.jpg', 'Center-cut pork chops, per kg', 45, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(80, 5, 'Fresh Shrimp', 399.99, 'https://example.com/images/seafood/shrimp.jpg', 'Large shrimp, peeled and deveined, per kg', 35, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(81, 5, 'Lamb Chops', 549.99, 'https://example.com/images/meat/lamb-chops.jpg', 'Fresh lamb chops, per kg', 30, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(82, 5, 'Fresh Tuna Steak', 449.99, 'https://example.com/images/seafood/tuna.jpg', 'Yellowfin tuna steak, per kg', 40, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(83, 5, 'Beef Ribeye', 599.99, 'https://example.com/images/meat/ribeye.jpg', 'Premium ribeye steak, per kg', 25, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(84, 5, 'Fresh Mussels', 299.99, 'https://example.com/images/seafood/mussels.jpg', 'Live mussels, per kg', 40, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(85, 5, 'Whole Chicken', 199.99, 'https://example.com/images/meat/whole-chicken.jpg', 'Fresh whole chicken, per piece', 55, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(86, 5, 'Fresh Cod Fillet', 379.99, 'https://example.com/images/seafood/cod.jpg', 'Fresh cod fillet, per kg', 45, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(87, 5, 'Turkey Breast', 289.99, 'https://example.com/images/meat/turkey-breast.jpg', 'Fresh turkey breast, per kg', 40, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(88, 5, 'Fresh Crab', 449.99, 'https://example.com/images/seafood/crab.jpg', 'Live mud crab, per kg', 30, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(89, 5, 'Beef Tenderloin', 699.99, 'https://example.com/images/meat/tenderloin.jpg', 'Premium beef tenderloin, per kg', 20, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(90, 5, 'Fresh Scallops', 549.99, 'https://example.com/images/seafood/scallops.jpg', 'Fresh sea scallops, per kg', 25, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(91, 6, 'Frozen Mixed Vegetables', 149.99, 'https://example.com/images/frozen/mixed-veg.jpg', 'Mixed vegetables, 1kg bag', 80, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(92, 6, 'Ice Cream - Vanilla', 199.99, 'https://example.com/images/frozen/ice-cream.jpg', 'Premium vanilla ice cream, 1L', 60, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(93, 6, 'Frozen Pizza', 249.99, 'https://example.com/images/frozen/pizza.jpg', 'Pepperoni pizza, family size', 70, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(94, 6, 'Frozen French Fries', 129.99, 'https://example.com/images/frozen/fries.jpg', 'Straight cut fries, 1kg bag', 90, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(95, 6, 'Frozen Fish Fillets', 299.99, 'https://example.com/images/frozen/fish.jpg', 'Breaded fish fillets, 500g pack', 65, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(96, 6, 'Frozen Dumplings', 219.99, 'https://example.com/images/frozen/dumplings.jpg', 'Pork and vegetable dumplings, 30pc', 75, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(97, 6, 'Frozen Berries', 189.99, 'https://example.com/images/frozen/berries.jpg', 'Mixed berries, 500g bag', 70, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(98, 6, 'Frozen Chicken Nuggets', 179.99, 'https://example.com/images/frozen/nuggets.jpg', 'Breaded chicken nuggets, 500g', 85, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(99, 6, 'Ice Cream - Chocolate', 199.99, 'https://example.com/images/frozen/chocolate-ice-cream.jpg', 'Premium chocolate ice cream, 1L', 60, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(100, 6, 'Frozen Corn', 99.99, 'https://example.com/images/frozen/corn.jpg', 'Sweet corn kernels, 500g bag', 95, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(101, 6, 'Frozen Meatballs', 249.99, 'https://example.com/images/frozen/meatballs.jpg', 'Beef meatballs, 1kg pack', 70, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(102, 6, 'Frozen Peas', 89.99, 'https://example.com/images/frozen/peas.jpg', 'Green peas, 500g bag', 100, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(103, 6, 'Frozen Spring Rolls', 169.99, 'https://example.com/images/frozen/spring-rolls.jpg', 'Vegetable spring rolls, 20pc', 80, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(104, 6, 'Frozen Shrimp', 349.99, 'https://example.com/images/frozen/shrimp.jpg', 'Peeled shrimp, 500g pack', 55, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(105, 6, 'Ice Cream - Strawberry', 199.99, 'https://example.com/images/frozen/strawberry-ice-cream.jpg', 'Premium strawberry ice cream, 1L', 60, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(106, 7, 'Microwave Rice Bowl', 129.99, 'https://example.com/images/ready-heat/rice-bowl.jpg', 'Individual teriyaki chicken rice bowl, 300g', 100, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(107, 7, 'Instant Lasagna', 199.99, 'https://example.com/images/ready-heat/lasagna.jpg', 'Ready to heat beef lasagna, 400g', 75, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(108, 7, 'Chicken Curry Pack', 179.99, 'https://example.com/images/ready-heat/curry.jpg', 'Microwaveable chicken curry with rice, 350g', 80, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(109, 7, 'Vegetable Biryani', 159.99, 'https://example.com/images/ready-heat/biryani.jpg', 'Ready to heat vegetable biryani, 300g', 90, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(110, 7, 'Mac and Cheese', 149.99, 'https://example.com/images/ready-heat/mac-cheese.jpg', 'Microwaveable macaroni and cheese, 250g', 85, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(111, 7, 'Beef Stew', 189.99, 'https://example.com/images/ready-heat/beef-stew.jpg', 'Ready to heat hearty beef stew, 400g', 70, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(112, 7, 'Tomato Soup', 99.99, 'https://example.com/images/ready-heat/tomato-soup.jpg', 'Microwaveable creamy tomato soup, 300ml', 95, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(113, 7, 'Chicken Alfredo', 169.99, 'https://example.com/images/ready-heat/alfredo.jpg', 'Ready to heat chicken alfredo pasta, 350g', 80, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(114, 7, 'Vegetable Curry', 149.99, 'https://example.com/images/ready-heat/veg-curry.jpg', 'Mixed vegetable curry with rice, 300g', 85, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(115, 7, 'Beef Burrito Bowl', 179.99, 'https://example.com/images/ready-heat/burrito-bowl.jpg', 'Mexican-style beef and rice bowl, 350g', 75, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(116, 7, 'Mushroom Risotto', 159.99, 'https://example.com/images/ready-heat/risotto.jpg', 'Creamy mushroom risotto, 300g', 80, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(117, 7, 'Sweet & Sour Chicken', 169.99, 'https://example.com/images/ready-heat/sweet-sour.jpg', 'Chinese-style sweet and sour chicken with rice, 350g', 70, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(118, 7, 'Lentil Soup', 109.99, 'https://example.com/images/ready-heat/lentil-soup.jpg', 'Hearty lentil soup, 300ml', 90, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(119, 7, 'Butter Chicken', 189.99, 'https://example.com/images/ready-heat/butter-chicken.jpg', 'Indian butter chicken with rice, 400g', 75, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(120, 7, 'Vegetable Pad Thai', 159.99, 'https://example.com/images/ready-heat/pad-thai.jpg', 'Thai-style vegetable noodles, 350g', 80, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(121, 8, 'Marinated Chicken Wings', 249.99, 'https://example.com/images/ready-cook/wings.jpg', 'BBQ marinated chicken wings, 500g', 70, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(122, 8, 'Seasoned Salmon Fillet', 299.99, 'https://example.com/images/ready-cook/salmon.jpg', 'Herb-seasoned salmon fillet, 200g', 60, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(123, 8, 'Beef Stir-Fry Kit', 269.99, 'https://example.com/images/ready-cook/stir-fry.jpg', 'Sliced beef with vegetables and sauce, 400g', 65, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(124, 8, 'Pork Tenderloin', 239.99, 'https://example.com/images/ready-cook/pork.jpg', 'Garlic-herb marinated pork tenderloin, 400g', 55, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(125, 8, 'Vegetable Kebabs', 179.99, 'https://example.com/images/ready-cook/kebabs.jpg', 'Seasoned vegetable skewers, 4 pieces', 80, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(126, 8, 'Marinated Lamb Chops', 349.99, 'https://example.com/images/ready-cook/lamb.jpg', 'Rosemary-garlic marinated lamb chops, 400g', 45, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(127, 8, 'Shrimp Scampi Kit', 289.99, 'https://example.com/images/ready-cook/scampi.jpg', 'Garlic butter shrimp with pasta, 350g', 60, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(128, 8, 'Stuffed Chicken Breast', 259.99, 'https://example.com/images/ready-cook/stuffed-chicken.jpg', 'Spinach and cheese stuffed chicken, 300g', 70, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(129, 8, 'Fish Taco Kit', 229.99, 'https://example.com/images/ready-cook/fish-taco.jpg', 'Seasoned fish with tortillas and sauce, 400g', 75, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(130, 8, 'Beef Burger Patties', 199.99, 'https://example.com/images/ready-cook/burger.jpg', 'Seasoned beef patties, 4 pieces', 85, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(131, 8, 'Vegetable Lasagna Kit', 219.99, 'https://example.com/images/ready-cook/veg-lasagna.jpg', 'Layered vegetable lasagna, ready to bake, 600g', 65, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(132, 8, 'Teriyaki Chicken', 239.99, 'https://example.com/images/ready-cook/teriyaki.jpg', 'Marinated teriyaki chicken strips, 400g', 70, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(133, 8, 'Seafood Paella Kit', 329.99, 'https://example.com/images/ready-cook/paella.jpg', 'Mixed seafood with rice and seasonings, 500g', 50, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(134, 8, 'Pork Schnitzel', 209.99, 'https://example.com/images/ready-cook/schnitzel.jpg', 'Breaded pork cutlets, 4 pieces', 75, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(135, 8, 'Vegetable Stir-Fry Kit', 189.99, 'https://example.com/images/ready-cook/veg-stir-fry.jpg', 'Mixed vegetables with stir-fry sauce, 400g', 80, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(136, 9, 'Fresh Milk', 89.99, 'https://example.com/images/dairy/milk.jpg', 'Full cream milk, 2L', 100, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(137, 9, 'Greek Yogurt', 129.99, 'https://example.com/images/dairy/yogurt.jpg', 'Plain Greek yogurt, 500g', 80, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(138, 9, 'Cheddar Cheese', 199.99, 'https://example.com/images/dairy/cheddar.jpg', 'Aged cheddar cheese block, 250g', 75, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(139, 9, 'Fresh Cream', 149.99, 'https://example.com/images/dairy/cream.jpg', 'Whipping cream, 500ml', 70, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(140, 9, 'Butter', 169.99, 'https://example.com/images/dairy/butter.jpg', 'Unsalted butter block, 250g', 85, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(141, 9, 'Mozzarella', 189.99, 'https://example.com/images/dairy/mozzarella.jpg', 'Fresh mozzarella ball, 200g', 65, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(142, 9, 'Sour Cream', 109.99, 'https://example.com/images/dairy/sour-cream.jpg', 'Sour cream tub, 300g', 90, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(143, 9, 'Cottage Cheese', 139.99, 'https://example.com/images/dairy/cottage.jpg', 'Low-fat cottage cheese, 400g', 75, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(144, 9, 'Flavored Yogurt Pack', 159.99, 'https://example.com/images/dairy/flavored-yogurt.jpg', 'Assorted fruit yogurts, 4x125g', 85, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(145, 9, 'Cream Cheese', 179.99, 'https://example.com/images/dairy/cream-cheese.jpg', 'Original cream cheese spread, 250g', 80, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(146, 9, 'Almond Milk', 129.99, 'https://example.com/images/dairy/almond-milk.jpg', 'Unsweetened almond milk, 1L', 70, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(147, 9, 'Parmesan Cheese', 249.99, 'https://example.com/images/dairy/parmesan.jpg', 'Aged Parmesan cheese block, 200g', 60, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(148, 9, 'Natural Yogurt', 119.99, 'https://example.com/images/dairy/natural-yogurt.jpg', 'Plain natural yogurt, 1kg', 85, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(149, 9, 'Feta Cheese', 189.99, 'https://example.com/images/dairy/feta.jpg', 'Greek feta cheese block, 200g', 70, '2025-02-15 14:19:51', '2025-02-15 14:19:51'),
(150, 9, 'Soy Milk', 119.99, 'https://example.com/images/dairy/soy-milk.jpg', 'Original soy milk, 1L', 75, '2025-02-15 14:19:51', '2025-02-15 14:19:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile_number` varchar(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','customer') NOT NULL DEFAULT 'customer',
  `terms_accepted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `mobile_number`, `password`, `role`, `terms_accepted`, `created_at`, `updated_at`) VALUES
(1, 'admin@ecomart.com', '09123456789', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 1, '2025-02-11 11:21:27', '2025-02-11 11:21:27'),
(2, 'user1@gmail.com', '09123456789', '$2y$10$GYCZiYk47iQgKWzrDGujDuU5KUFU8awWElt8Rycx6C8BM1Z9UjvEy', 'customer', 1, '2025-02-15 23:12:48', '2025-02-15 23:12:48'),
(3, 'user2@gmail.com', '09234567890', '$2y$10$wbHtEt0KGY6T3Ql27/O8xeMRseu9nyhPwTzpdjeCV2HRj1cci28Mm', 'customer', 1, '2025-02-16 19:20:57', '2025-02-16 19:20:57'),
(4, 'user3@gmail.com', '09345678901', '$2y$10$iPx5YPjt6qbM0uqcEg3NLufOs8QmF0C4cNPXiCtQMKdAaFkAewSIG', 'customer', 1, '2025-02-16 20:05:20', '2025-02-16 20:05:20'),
(5, 'business.jlte@gmail.com', '09052367934', '$2y$10$u6a.WV/ewUtevdFj7ugV.u90jIb0WCVnbW22OJH83W7lWTxl3QqFS', 'customer', 1, '2025-02-17 16:08:55', '2025-02-17 16:08:55');

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `profile_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`profile_id`, `user_id`, `first_name`, `last_name`, `gender`, `birthdate`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ecomart', 'Admin', 'other', '2000-01-01', '2025-02-11 11:22:29', '2025-02-11 11:22:29'),
(2, 2, 'User', 'One', 'male', '2016-02-12', '2025-02-15 23:12:48', '2025-02-15 23:12:48'),
(3, 3, 'User', 'Two', 'male', '1997-05-16', '2025-02-16 19:20:57', '2025-02-16 19:20:57'),
(4, 4, 'User ', 'Three', 'female', '2002-10-21', '2025-02-16 20:05:20', '2025-02-16 20:05:20'),
(5, 5, 'John Leonard', 'Esperancilla', 'male', '2025-02-17', '2025-02-17 16:08:55', '2025-02-17 16:08:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cartitems`
--
ALTER TABLE `cartitems`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`profile_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cartitems`
--
ALTER TABLE `cartitems`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `cartitems`
--
ALTER TABLE `cartitems`
  ADD CONSTRAINT `cartitems_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  ADD CONSTRAINT `cartitems_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
