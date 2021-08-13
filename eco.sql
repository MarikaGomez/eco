-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 13 août 2021 à 19:46
-- Version du serveur :  10.4.19-MariaDB
-- Version de PHP : 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `eco`
--

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total` double(7,2) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` enum('pending','send','delivered','cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `orderdetails_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `brand` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `category` varchar(60) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `product_img` text NOT NULL,
  `product_img2` text NOT NULL,
  `product_img3` text NOT NULL,
  `product_img4` text NOT NULL,
  `details` text NOT NULL,
  `compo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`product_id`, `brand`, `name`, `category`, `price`, `product_img`, `product_img2`, `product_img3`, `product_img4`, `details`, `compo`) VALUES
(1, 'FENTY BEAUTY', 'Eaze Drop Blurring Skin Tint', 'Makeup', '29.50', 'img/produit.png', 'img/produit-side.png', 'img/produit-side1.png', 'img/produit-side11.png', 'A lightweight, buildable light-to-medium coverage skin tint that leaves skin looking blurred and smoothed – in flexible shades for all.', 'Aqua/Water/Eau, Dimethicone, Talc, Dicaprylyl Carbonate, Isostearyl Neopentanoate, Peg-10 Dimethicone, Dimethicone/Vinyl Dimethicone Crosspolymer, Glycerin, Trimethylsiloxysilicate, Isododecane, Bis-Peg/Ppg-14/14 Dimethicone, Phenoxyethanol, Sodium Chloride, Dimethicone Crosspolymer, Magnesium Sulfate, Hydrogen Dimethicone, Sodium Dehydroacetate, Trehalose, Urea, Potassium Sorbate, Silica, Disteardimonium Hectorite, Aluminum Hydroxide, Benzoic Acid, Sodium Hyaluronate, C24-28 Alkyl Methicone, Pentylene Glycol, Serine, Dehydroacetic Acid, Propylene Carbonate, Ethylhexylglycerin, Algin, Caprylyl Glycol, Disodium Phosphate, Glyceryl Polyacrylate, Pullulan, Tocopherol, Potassium Phosphate, Iron Oxides (Ci 77491, Ci 77492, Ci 77499), Titanium Dioxide (Ci 77891).'),
(2, 'FENTY BEAUTY', 'Match Stix Trio', 'Makeup', '27.00', 'img/produit2.png', 'img/produit2-side.png', 'img/produit2-side1.png', 'img/produit2-side11.png', 'A magnetized trio of long-wear, light-as-air makeup sticks curated by skin tone, with two Match Stix Matte Skinsticks to conceal and contour, and one Match Stix Shimmer Skinstick to highlight.', 'Bamboo, Mocha:\r\nTricaprylin, C12-15 Alkyl Ethylhexanoate, Polyethylene, Polymethyl Methacrylate, Octyldodecanol, Sucrose Acetate Isobutyrate, Mica, Cera Microcristallina/Microcrystalline Wax/Cire Microcristalline, Octyldodecyl Neopentanoate, Silica, Polymethylsilsesquioxane, Caprylyl Glycol, Cetyl Peg/Ppg-10/1 Dimethicone, Vp/Eicosene Copolymer, Vp/Hexadecene Copolymer, Cocos Nucifera (Coconut) Oil, Pentaerythrityl Tetra-Di-T-Butyl Hydroxyhydrocinnamate, Tocopheryl Acetate, Ascorbyl Palmitate, Sodium Hyaluronate, Tocopherol, Calcium Sodium Borosilicate, Synthetic Fluorphlogopite, Calcium Aluminum Borosilicate, Polyethylene Terephthalate, Acrylates Copolymer, Tin Oxide. May Contain/Peut Contenir (+/-): Titanium Dioxide (Ci 77891), Iron Oxides (Ci 77491, Ci 77492, Ci 77499), Yellow 6 Lake (Ci 15985), Yellow 5 Lake (Ci 19140).\r\n\r\nTrippin:\r\nEthylhexyl Isononanoate, Mica, Octyldodecanol, Polymethyl Methacrylate, Sucrose Acetate Isobutyrate, C20-40 Alcohols, Tribehenin, Paraffin, Polyethylene, Vp/Eicosene Copolymer, Vp/Hexadecene Copolymer, Diisostearyl Malate, Cera Microcristallina/Microcrystalline Wax/Cire Microcristalline, Caprylyl Glycol, Phenoxyethanol, Tocopheryl Acetate, Hexylene Glycol, Tocopherol, Isostearyl Alcohol, Ascorbyl Palmitate, Malic Acid, Calcium Sodium Borosilicate, Synthetic Fluorphlogopite, Calcium Aluminum Borosilicate, Polyethylene Terephthalate, Acrylates Copolymer, Silica, Tin Oxide, Titanium Dioxide (Ci 77891), Iron Oxides (Ci 77491), Red 7 Lake (Ci 15850), Yellow 6 Lake (Ci 15985), Carmine (Ci 75470). Caramel & Truffle: Tricaprylin, C12-15 Alkyl Ethylhexanoate, Polyethylene, Polymethyl Methacrylate, Octyldodecanol, Sucrose Acetate Isobutyrate, Mica, Cera Microcristallina/Microcrystalline Wax/Cire Microcristalline, Octyldodecyl Neopentanoate, Silica, Polymethylsilsesquioxane, Caprylyl Glycol, Cetyl Peg/Ppg-10/1 Dimethicone, Vp/Eicosene Copolymer, Vp/Hexadecene Copolymer, Cocos Nucifera (Coconut) Oil, Pentaerythrityl Tetra-Di-T-Butyl Hydroxyhydrocinnamate, Tocopheryl Acetate, Ascorbyl Palmitate, Sodium Hyaluronate, Tocopherol, Calcium Sodium Borosilicate, Synthetic Fluorphlogopite, Calcium Aluminum Borosilicate, Polyethylene Terephthalate, Acrylates Copolymer, Tin Oxide. May Contain/Peut Contenir (+/-): Titanium Dioxide (Ci 77891), Iron Oxides (Ci 77491, Ci 77492, Ci 77499), Yellow 6 Lake (Ci 15985), Yellow 5 Lake (Ci 19140).'),
(3, 'FENTY BEAUTY', 'Gloss Bomb Cream Color Drip Lip Cream', 'Makeup', '19.00', 'img/produit3.png', 'img/produit3-side.png', 'img/produit3-side1.png', 'img/produit3-side11.png', 'A cult-fave lip gloss, now with pure, creamy color and incredible shine, that instantly leaves lips looking smoother and more voluminous.', 'Polybutene, Diisostearyl Malate, Bis-Diglyceryl Polyacyladipate-2, Octyldodecanol, Caprylic/Capric Triglyceride, Polyethylene, Silica, Butyrospermum Parkii (Shea) Butter, Ethylhexyl Palmitate, Phenoxyethanol, Tocopherol, Cetearyl Alcohol, Parfum/Fragrance, Tribehenin, Helianthus Annuus (Sunflower) Seed Oil, Cera Microcristallina/Microcrystalline Wax/Cire Microcristalline, Retinyl Palmitate, Sorbitan Isostearate, Mica, Lactic Acid, Palmitoyl Tripeptide-1, Citric Acid. May Contain/Peut Contenir (+/-): Iron Oxides (Ci 77491, Ci 77492, Ci 77499), Yellow 5 Lake (Ci 19140), Titanium Dioxide (Ci 77891), Red 7 Lake (Ci 15850).'),
(4, 'Mizani', 'True Textures Moroccan Clay Steam Hair Mask', 'Hair', '34.00', 'img/produit4.png', 'img/produit4-side.png', 'img/produit4-side1.png', 'img/produit4-side11.png', 'A deep-conditioning hair mask treatment for curls and coils that reduces dryness, enhances softness, improves manageability, and restores moisture.', '-Marula Oil: Provides frizz control.\r\n-Moroccan Lava Clay: Reduces dryness and frizz and aids in detangling.\r\n-Olive Oil: Moisturizes and adds shine and softness.\r\n\r\nWater, Cetearyl Alcohol, Helianthus, Annuus Seed Oil/Sunflower Seed Oil, Behentrimonium Chloride, Glyceryl, Stearate Se, Butyrospermum Parkii Butter/Shea Butter, Isopropyl, Palmitate, Benzyl Alcohol, Parfum/Fragrance, Isopropyl Alcohol, Sclerotium Gum, Moroccan Lava Clay, Caprylyl Glycol, Salicylic, Acid, Sclerocarya Birrea Seed Oil, Cocos Nucifera Oil/Coconut Oil, Olea Europaea Fruit Oil/Olive Fruit Oil, Tocopherol, Limonene, Coumarin, Glycine Soja Oil/Soybean Oil, Citric Acid.'),
(5, 'Mizani', 'True Textures Twist and Coil Jelly', 'Hair', '20.00', 'img/produit5.png', 'img/produit5-side.png', 'img/produit5-side1.png', 'img/produit5-side11.png', 'A moisturizing styling gel in jelly form with medium hold that defines tight coils and curls for a no-crunch, frizz-free look.', '-Coconut Oil: Enhances moisture and offers frizz control.\r\n-Marula Oil: Provides frizz control and supports smoothness.\r\n-Olive Oil: Moisturizes and adds shine and softness.\r\n\r\nWater, Sorbitol, Glycerin, Benzyl Alcohol, Dehydroxanthan Gum, Fragrance, Phenoxyethanol, Lithium Magnesium Sodium Silicate, Ethylhexylglycerin, Olea Europaea Oil/Olive Fruit Oil, Sclerocarya Birrea Seed Oil, Cocos Nucifera Oil/Coconut Oil, Limonene, Coumarin, 2-Oleamido-1, 3-Octadecanediol, Linalool, Hydroxycitronellal, Citral, Geraniol, Tocopherol.'),
(6, 'Moroccanoil', 'Restorative Hair Mask', 'Hair', '42.00', 'img/produit6.png', 'img/produit6-side.png', 'img/produit6-side1.png', 'img/produit6-side11.png', 'A protein-rich, argan-oil-infused hair mask that restores and helps repair dry, weakened hair to improve texture, elasticity, and manageability.', '-Argan Oil: Helps to nurture hair.\r\n-Shea Butter: Provides nourishing benefits to hair and scalp.\r\n-Caryocar Brasiliense Fruit Oil: Nurtures hair with vitamins and essential fatty acids.\r\n\r\nWater, Cetearyl Alcohol, Argania Spinosa (Argan) Kernel Oil, Canola Oil, Parfum/Fragrance, Butyrospermum Parkii (Shea) Butter, Behentrimonium Methosulfate, Cetyl Alcohol, Ceteareth-20, Acetamide Mea, Caryocar Brasiliense Fruit Oil, Steareth-2, Peg-60 Almond Glycerides, Hydrolyzed Vegetable Protein PG-Propyl Silanetriol, Dmdm Hydantoin, Citric Acid, Butylene Glycol, Isopropyl Alcohol, Phenoxyethanol, Behentrimonium Chloride, Butylphenyl Methylpropional, Hydroxyisohexyl 3-Cyclohexene Carboxaldehyde, Alpha-Isomethyl Ionone, Linalool.'),
(7, 'Moroccanoil', 'Intense Hydrating Mask', 'Hair', '38.00', 'img/produit7.png', 'img/produit7-side.png', 'img/produit7-side1.png', 'img/produit7-side11.png', 'A high-performance, argan-oil-rich mask formulated for medium to thick dry hair that improves hydration, texture, elasticity, shine, and manageability.', '-Argan Oil: Restores elasticity, smoothness, and manageability to hair.\r\n-Behentrimonium Chloride: An anti-static and conditioning agent.\r\n-Glycerin: Natural humectant; provides hair moisturizing benefits.\r\n-Linseed Extract: Derived from flaxseed, a good source of alpha linolenic acid; an essential fatty acid that helps improve the health of hair.\r\n\r\nWater, Cetearyl Alcohol, Argania Spinosa (Argan) Kernel Oil, Glycerin, Dimethicone, Cetrimonium Chloride, Cetyl Alcohol, Behentrimonium Chloride, Isopropyl Alcohol, Fragrance, DMDM Hydantoin, Citric Acid, CI 19140 (Yellow 5), Linum Usitatissimum (Linseed) Seed Extract, CI 15985 (Yellow 6), Butylphenyl Methylpropional, Hydroxyisohexyl 3-Cyclohexene Carboxaldehyde, Linalool, Alpha-Isomethylionone.'),
(8, 'Mizani', '25 Miracle Milk Leave-In Conditioner', 'Hair', '35.00', 'img/produit8.png', 'img/produit8-side.png', 'img/produit8-side1.png', 'img/produit8-side11.png', 'A lightweight leave-in conditioner with heat protection that detangles, repairs damage, treats dryness, and controls frizz.', '-Coconut Oil: Moisturizes dry hair and adds shine and softness.\r\n- Fennel Seed Oil: Strengthens hair and prevents breakage.\r\n\r\nWater, Cocos Nucifera Oil/Coconut Oil, Amodimethicone, PPG-5-Ceteth-10 Phosphate, Polyquaternium-37, Phenoxyethanol, Propylene Glycol Dicaprylate/Dicaprate, Acetamide Mea, Frangrance, Lactamide Mea, Dimethicone PEG-7 Phosphate, Butylene Glycol, PPG-1 Trideceth-6, Trideceth-6, Behentrimonium Chloride, Xylose, Ethylhexylglycerin, Helianthus Annuus Seed Extract/Sunflower Seed Extract, Sodium Hydroxide, Linalool, Benzophenone-4, Cetrimonium Chloride, Tocopherol, Olea Europaea Oil/Olive Fruit Oil, Camelina Sativa Oil/Camelina Sativa Seed Oil, Ascorbyl Glucoside, Benzyl Alcohol, Geraniol, Citronellol, Benzyl Salicylate, Hydrolyzed Vegetable Protein PG-Propyl Silanetriol, Isoeugenol, Foeniculum Vulgare (Fennel) Seed Extract, Melanin.'),
(9, 'MAKE UP FOR EVER', 'Ultra HD Invisible Cover Foundation', 'Makeup', '43.00', 'img/produit9.png', 'img/produit9-side.png', 'img/produit9-side1.png', 'img/produit9-side11.png', 'An iconic foundation that provides undetectable medium coverage and a blurred, second-skin finish for up to 24 hours, now in 50 shades to match your skin.', 'Cyclopentasiloxane, Water, Peg-10 Dimethicone, Neopentyl Glycol Diethylhexanoate, Talc, Mica, Phenyl Trimethicone, Sodium Chloride, Lauroyl Lysine, Dimethicone Crosspolymer, Methylpropanediol, Glyceryl Caprylate, Propanediol, Disteardimonium Hectorite, Sucrose Palmitate, Phenoxyethanol, Sodium Myristoyl Glutamate, Alumina, Cyclohexasiloxane, Propylene Carbonate, Pentylene Glycol, Sorbitan Sesquioleate, Evodia Rutaecarpa Fruit Extract, Tocopheryl Acetate, Glyceryl Linoleate, Aluminum Hydroxide, Glycerin, Fragrance, Benzyl Alcohol, Benzyl Benzoate, Citric Acid, Potassium Sorbate, Sodium Hyaluronate, Tin Oxide, Bht, Tocopherol. May Contain (+/-): Yellow 5/Yellow 5 Lake (Ci 19140), Blue 1 Lake (Ci 42090), Ultramarines (Ci 77007), Bismuth Oxychloride (Ci 77163), Iron Oxides (Ci 77491, Ci 77492, Ci 77499), Titanium Dioxide (Ci 77891).'),
(10, 'bareMinerals', 'Original Loose Powder Mineral Foundation SPF 15 ', 'Makeup', '32.00', 'img/produit10.png', 'img/produit10-side.png', 'img/produit10-side1.png', 'img/produit10-side11.png', 'A lightweight, skin-improving mineral foundation that provides buildable sheer-to-full coverage with a natural, luminous finish.', '-Titanium Dioxide and Zinc Oxide: Mineral sunscreen protection\r\n\r\nMica, Titanium Dioxide, Iron Oxides, Bismuth Oxychloride.'),
(11, 'Too Faced', 'Born This Way Super Coverage Multi-Use Concealer', 'Makeup', '30.00', 'img/produit11.png', 'img/produit11-side.png', 'img/produit11-side1.png', 'img/produit11-side11.png', 'A hydrating, full-coverage, weightless, four-in-one formula that conceals, contours, highlights, and retouches in a wide range of flawless shades.', 'Water, Cyclopentasiloxane, Butylene Glycol Dicaprylate/Dicaprate, Triethylhexanoin, Isoamyl Laurate, Methyl Trimethicone, Pentylene Glycol, Polyglyceryl-4 Diisostearate/Polyhydroxystearate/ Sebacate, Hydrogenated Starch Hydrolysate, Cetyl PEG/PPG-10/1 Dimethicone, Trimethylsiloxysilicate; Silica, Perfluorooctyl Triethoxysilane, Aluminum Hydroxide, Hydroxyacetophenone, Sodium Chloride, Disteardimonium Hectorite, Dimethicone, Acrylates/Polytrimethylsiloxymethacrylate Copolymer, 1,2-Hexanediol, Caprylyl Glycol, Dimethicone/Vinyl Dimethicone Crosspolymer, Trisodium Ethylenediamine Disuccinate, Glycerin, Cocos Nucifera (Coconut) Water/Cocos Nucifera Water, Sodium Hyaluronate, Cocos Nucifera (Coconut) Fruit Juice/Cocos Nucifera Fruit Juice, Rhododendron Ferrugineum Extract, Potassium Sorbate, Sodium Benzoate, Titanium Dioxide (Ci 77891), Iron Oxides (Ci 77491, Ci 77492, Ci 77499).'),
(12, 'fresh', 'Rose Deep Hydration Oil-Infused Serum', 'Skincare', '59.00', 'img/produit12.png', 'img/produit12-side.png', 'img/produit12-side1.png', 'img/produit12-side11.png', 'An oil-infused liquid serum created to deliver up to 24 hours of hydration for dewy-looking skin that’s visibly plumped with moisture.', '-Plant-Derived Squalane: Protects skin and prevents moisture loss.\r\n-Water Phase: Helps to soothe, calm and hydrate.\r\n-Oil Phase: Nourishes and softens.\r\n\r\nAqua (Water), Rosa Damascena Flower Water, Coco-Caprylate/Caprate, C9-12 Alkane, Propanediol, Ethylhexyl Palmitate, Pentylene Glycol, Glycerin, Squalane, Rosa Damascena Flower Extract, Rosa Damascena Extract, Camelina Sativa Seed Oil, Rosa Rubiginosa Seed Oil, Cucumis Sativus (Cucumber) Fruit Extract, Rosa Damascena Flower Oil, Tocopherol, Sodium Citrate, Sodium Chloride, Ethylhexylglycerin, Xanthan Gum, Citric Acid, Caprylic/Capric Tri-glyceride, Sorbitan Sesquioleate, 1,2- Hexanediol, Caprylyl Glycol, Sodium Benzoate, Potassium Sorbate, Citronellol, Geraniol'),
(13, 'Saint Jane Beauty', 'Luxury CBD Beauty Serum', 'Skincare', '125.00', 'img/produit13.png', 'img/produit13-side.png', 'img/produit13-side1.png', 'img/produit13-side11.png', 'An antioxidant packed serum with 500 mg of full-spectrum CBD plus 20 potent botanicals that help to deeply hydrate, detoxify pores, and boost skin\'s natural glow.', '-Full-spectrum CBD: Nutrient-dense, whole plant cannabis molecules penetrate quickly to visibly calm redness, clear blemishes, and deeply restore.\r\n-Potent Botanical Blend: Highly active botanicals like sea buckthorn, rosehip, and helichrysum empower cell turnover for a smooth, radiant complexion.\r\n-Cold-pressed Grapeseed Oil: More powerful than vitamin C, this organic grape seed oil is packed with omegas, antioxidants, and vitamins to soothe and even skin tone. Helianthus Annuus (Sunflower) Seed Oil, Butyrospermum Parkii (Shea) Nut Butter, Punica Granatum (Pomegranate) Seed Extract, Vitus Vinifera (Grape) Seed Oil, Cannabidiol (Full Spectrum CBD), Rosa Canina (Rosehip) Seed Extract, Hippophae Rhamnoides (Seabuckthorn) Fruit Extract, Simmondsia Chinensis (Jojoba) Seed Oil, Rosa Damascena (Rose) Flower Oil, Helichrysum Italicum (Helichrysum) Flower Oil, Cymbopogon Martinii V. Motia (Palmarosa) Leaf Oil, Santalum Spicatum (Sandalwood) Wood Oil, Boswellia Carterii (Frankincense) Resin Extract, Pelargonium Graveolens (Geranium) Leaf/Flower Oil, Commiphora Abyssinica (Myrrh) Resin Extract, Calendula Officinalis (Calendula) Flower Extract, Nardostachys Chinensis (Spikenard) Root Oil, Tocopherol (Vitamin E), Opuntia Ficus-Indica (Prickly Pear) Seed Oil, Rosmarinus Officinalis (Rosemary) Leaf Extract.'),
(14, 'Kiehl\'s Since 1851', 'Clearly Corrective Dark Spot Correcting Serum', 'Skincare', '84.00', 'img/produit14.png', 'img/produit14-side.png', 'img/produit14-side1.png', 'img/produit14-side11.png', 'A brightening face serum that helps reduce the look of dark spots, hyperpigmentation, and post-acne marks.', '-Activated C: Attacks deep-set dark spots while diminishing the formation of new discolorations for visibly more uniform skin tone and clarity.\r\n-White Birch Extract: Supports natural skin elasticity and collagen production resulting in the appearance of increased skin density, volume, and thickness.\r\n-Peony Extract and Activated C: Facilitates the reversal of discoloration for skin clarity.\r\n\r\nAqua/Water, Propylene Glycol, Glycerin, Alcohol Denat., PEG/PPG/Polybutylene Glycol-8/5/3 Glycerin, Hydroxypropyl Tetrahydropyrantriol, 3-O-Ethyl Ascorbic Acid, PPG-6-Decyltetradeceth-30, Phenoxyethanol, Salicylic Acid, Xanthan Gum, Hydroxyethylcellulose, Potassium Hydroxide, Citric Acid, Sodium Citrate, Tocopheryl Acetate, Lavandula Angustifolia Oil/Lavender Oil, Disodium EDTA, Adenosine, Linalool, Butylene Glycol, Tocopherol, Citrus Aurantium Tachibana Peel Extract, Paeonia Suffruticosa Root Extract.'),
(15, 'Youth To The People', 'Superfood Antioxidant Cleanser', 'Skincare', '36.00', 'img/produit15.png', 'img/produit15-side.png', 'img/produit15-side1.png', 'img/produit15-side11.png', 'An award-winning face wash with cold-pressed antioxidants to remove makeup, prevent buildup in pores, and support skin’s pH balance.', 'Water, Cocamidopropyl Hydroxysultaine, Sodium Cocoyl Glutamate, Aloe Barbadensis Leaf (Aloe Vera) Juice, Sorbeth-230 Tetraoleate, Polysorbate 20, Brassica Oleracea Acephala (Kale) Extract, Spinacia Oleracea (Spinach) Leaf Extract, Camellia Sinensis (Green Tea) Leaf Extract, Medicago Sativa (Alfalfa) Extract, Chamomilla Recutita (Matricaria) Flower Extract, Tetrahexyldecyl Ascorbate (Vitamin C), Glycerin, Panthenol (Vitamin B5), Tocopheryl Acetate (Vitamin E), Decyl Glucoside, Sorbitan Laurate, Tetrasodium Glutamate Diacetate, Gluconolactone, Calcium Gluconate, Ethylhexylglycerin, Maltodextrin, Citric Acid, Phenoxyethanol, Potassium Sorbate, Sodium Benzoate, Chlorophyllin-Copper Complex (CI 75810), Gardenia Jasminoides (Jasmine) Fruit Extract, Fragrance.'),
(16, 'Chloé', 'Chloé Eau de Parfum', 'Fragrance', '132.00', 'img/produit16.png', 'img/produit16-side.png', 'img/produit16-side1.png', 'img/produit16-side11.png', 'Chloé Eau de Parfum captures the creative, confident individuality of the Chloé woman. It is a fresh and feminine fragrance suited to a free spirit with an utterly innate sense of chic.\r\n\r\nThe scent takes the classic rose and ingeniously translates it into a vibrant perfume, intimate and sensual. Chloé Eau de Parfum begins with a combination of floral powdery notes: hints of peony, lychee, and springtime freesia. The airy, flirtatious head notes drift away to reveal the richer and more sensual side of the rose. The distinctive character of this unique rose is accompanied by magnolia and lily of the valley, as well as subtle intimations of warm amber and elegant cedarwood.\r\n\r\nThe fragrance is enclosed in a modern, delicately pleated bottle adorned with a hand-tied ribbon.', 'Alcohol Denat., Fragrance, Water, Butylphenyl Methylpropional, Ethylhexyl Methoxycinnamate, Acrylates/Octylacrylamide Copolymer, Alpha-Isomethyl Ionone, Benzophenone-3, Benzyl Salicylate, Bht, Butyl Methoxydibenzoylmethane, Citronellol, Ethylhexyl Salicylate, Geraniol, Hexyl Cinnamal, Hydrolyzed Jojoba Esters, Hydroxycitronellal, Hydroxyisohexyl 3-Cyclohexene Carboxaldehyde, Limonene, Linalool, Fd&C Red No. 4 (Ci 14700), Fd&C Yellow No.5 (Ci 19140).'),
(17, 'Valentino', 'Donna Born In Roma Eau de Parfum', 'Fragrance', '135.00', 'img/produit17.png', 'img/produit17-side.png', 'img/produit17-side1.png', 'img/produit17-side11.png', 'Donna Born in Roma is a modern haute couture floriental. The couture elegance is made of three qualities of jasmine which bring a luxurious femininity when blended with vanilla bourbon, the most expensive extract in the world. This mix is twisted with a radiant trio of modern wood, which gives an edgy touch reminiscent of Rome street culture.', 'Alcohol, Parfum/Fragrance, Aqua/Water, Benzyl Salicylate, Hydroxycitronellal, Benzyl Alcohol, Limonene, Butyl Methoxydibenzoylmethane, Ethylhexyl Salicylate, Linalool, Alpha-Isomethyl Ionone, Isoeugenol, Methylanthranilate, Citronellol, Benzyl Benzoate, Coumarin, Geraniol, Benzyl Cinnamate, Tris(Tetramethylhydroxypiperidinol), Citrate, Citral, Farnesol, Eugenol, Ci 14700 / Red 4, Ci 60730 / Ext. Violet 2.'),
(18, 'Mugler', 'Angel Nova Eau de Parfum', 'Fragrance', '100.00', 'img/produit18.png', 'img/produit18-side.png', 'img/produit18-side1.png', 'img/produit18-side11.png', 'This fruity-floral perfume for women opens with an explosion of juicy raspberry and up-cycled rose, extracted through a sustainable double distillation of rose petals. Warm akigalawood at the base transforms the scent for a captivating, long-lasting experience.', 'Alcohol, Parfum/Fragrance, Aqua/Water/Eau, Linalool, Limonene, Geraniol, Citronellol, Coumarin, Citral, Citric Acid, Anise Alcohol, Disodium EDTA.'),
(19, 'Mugler', 'Angel Eau de Parfum', 'Fragrance', '85.00', 'img/produit19.png', 'img/produit19-side.png', 'img/produit19-side1.png', 'img/produit19-side11.png', 'Dreams and fantasies come true with the celestial, delicious, and voluptuous facets of Angel. Sensations of serenity, unbridled joy, and sophisticated sensuality delight her and make her seem absolutely edible.\r\n\r\nWith Angel, Mugler has created a classic that had never been seen, imagined, or experienced before. Angel is an addictive fragrance with airy fresh facets, delicious mouth-watering aromas and mysterious notes that capture the essence of sensuality. Angel evokes the emotion of joyful memories with a sense of dreamlike infinity.\r\n\r\nMugler Angel is a glamorous fragrance for the woman who is half-angelic and half-devilish.', 'Alcohol, Fragrance, Water, Butylphenyl Methylpropional, Ethylhexyl Methoxycinnamate, Butyl Methoxydibenzoylmethane, Ethylhexyl Salicylate, Bht, Coumarin, Limonene, Linalool, Geraniol, Amyl Cinnamal, Citronellol, Benzyl, Salicylate, Citral, Farnesol, Hexyl Cinnamal, Eugenol, Benzyl, Benzoate, Isoeugenol, Ci 60730/Ext, Violet 2, Ci 19140/Yellow 5, Ci 42090/Blue 1, Ci 17200/Red 33.'),
(20, 'Viktor&Rolf', 'Flowerbomb', 'Fragrance', '115.00', 'img/produit20.png', 'img/produit20-side.png', 'img/produit20-side1.png', 'img/produit20-side11.png', 'This veritable garden party in a bottle is an intoxicating perfume for women that is an enchanting whirl of cattleya, jasmine, and rose perfumes. Grounded in patchouli and vanilla, Flowerbomb is an addictive women’s fragrance of lavish beauty and voluptuous sensuality.', 'Alcohol, Parfum/Fragrance, Aqua/Water, Benzyl Salicylate, Linalool, Butyl Methoxydibenzoylmethane, Ethylhexyl Methoxycinnamate, Limonene, Pentaerythrityl Tetra-Di-T-Butyl Hydroxyhydrocinnamate, Coumarin, Benzyl Alcohol, Benzyl Benzoate, Citral, Ci 19140/Yellow 5, Ci 60730/Ext. Violet 2, Ci 17200/Red 33.'),
(21, 'Too Faced', 'Better Than Sex Volumizing Mascara', 'Makeup', '26.00', 'img/produit21.png', 'img/produit21-side.png', 'img/produit21-side1.png', 'img/produit21-side11.png', 'An intensely black volumizing mascara for the sexiest, most defined lashes possible.', '-Film-Forming Polymer: Locks curl in place.\r\n-Acacia Senegal Tree Extract: Sets volume.\r\n-Collagen: Imparts a plumping effect.\r\n\r\nWater, Synthetic Beeswax, Paraffin, Glyceryl Stearate, Acacia Senegal Gum, Butylene Glycol, Oryza Sativa (Rice) Bran Wax/Oryza Sativa Bran Cera, Stearic Acid, Palmitic Acid, Polybutene, VP/Eicosene Copolymer, Copernicia Cerifera (Carnauba) Wax/Copernicia Cerifera Cera/Cire De Carnauba, Aminomethyl Propanol, Glycerin, PVP, Ethylhexylglycerin, Hydroxyethylcellulose, Disodium EDTA, Polyester-11, Cellulose, Trimethylpentanediol/Adipic Acid/Glycerin Crosspolymer, Propylene Glycol, Disodium Phosphate, Polysorbate 60, Acacia Seyal Gum Extract, Sodium Phosphate, Acetyl Hexapeptide-1, Dextran, Phenoxyethanol, Potassium Sorbate, Iron Oxides (CI 77499), Ultramarines (CI 77007), Black 2 (CI 77266).');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `name` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `email` varchar(60) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(10) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`orderdetails_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `orderdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;