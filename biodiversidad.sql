-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2021 a las 00:08:01
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biodiversidad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especie`
--

CREATE TABLE `especie` (
  `id_especie` int(11) NOT NULL,
  `nombre_cientifico` varchar(40) NOT NULL,
  `nombre_comun` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `estado_conservacion` varchar(40) DEFAULT NULL,
  `id_parque` int(11) NOT NULL,
  `img` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `especie`
--

INSERT INTO `especie` (`id_especie`, `nombre_cientifico`, `nombre_comun`, `descripcion`, `estado_conservacion`, `id_parque`, `img`) VALUES
(1, 'Lontra provocax', 'Huillín', 'Es una nutria de 120 cm de largo que vive exclusivamente en el sur de Argentina y Chile, y por su actual estado de conservación se la considera en situación vulnerable. Es un carnívoro autóctono y endémico de la Patagonia de Argentina y Chile que habita los lagos, ríos, arroyos y lagunas de nuestra región. Su cuerpo es hidrodinámico lo que lo hace un buen nadador, es un mamífero anfibio que depende del agua y de las costas para completar su ciclo de vida. Elije cuevas que utiliza como madrigueras y sitios de descanso con vegetación, troncos y rocas. Se alimenta de cangrejos de agua dulce y langostinos y en ocasiones come peces como percas y puyenes. Su conservación depende de cuidar el estado natural de las costas y de mantener el agua libre de contaminación.', 'En peligro', 4, NULL),
(3, 'Atelognathus nitoi', 'Rana del Chalhuaco', 'Este anfibio es de cuerpo robusto, patas relativamente cortas y en sus pies tienen membranas interdigitales. Habita solamente algunos cuerpos de agua del cerro Chalhuaco, es herbívoro cuando es renacuajo e insectívoro cuando pasa a la etapa juvenil y adulta en la vida terrestre. La zona donde vive esta especie está declarada como “Área crítica cuencas Ñirihuau y Challhuaco”', 'Vulnerable', 4, NULL),
(4, 'Merganetta armata', 'Pato de los torrentes', 'Se distribuye desde Venezuela hasta Tierra del Fuego y su hábitat está restringido y asociado exclusivamente a arroyos y ríos de montaña. Se alimenta de larvas de insectos acuáticos que captura bajo el agua. Nidifica en cavidades de árboles que crecen en las orillas o paredones.', 'Preocupación menor', 4, NULL),
(5, 'Sapajus apella', 'Mono caí', 'Se caracteriza por presentar en el cuerpo un pelaje que varía de castaño claro a castaño oscuro o marrón a rojizo; en las extremidades y cola presenta una coloración que varía de marrón oscuro a negro, siendo estas últimas las partes más oscuras del cuerpo. En la frente presenta pelaje erecto semejando unos cachos de allí su nombre, el rostro puede presentar pelaje corto que se esparce sobre la piel negra. Es una especie relativamente grande, la longitud entre cabeza cuerpo está entre 35 y 49 cm, y posee una cola prensil de entre 38 y 49 cm, los machos pesan alrededor de 3,7 kg y las hembras 2,3 kg. Al igual que otros cebides habita en la selva húmeda tropical, se desplaza en árboles de gran altura y se caracterizan por presentar hábitos diurnos, ser activos e inquietos.', 'Preocupación menor', 2, NULL),
(6, 'Sciurus ingrami', 'Ardilla serelepe', 'Es la única ardilla en su hábitat por lo cual no puede ser confundida en su ambiente natural. Es de coloración olivácea, con tonos blancuzco o blancuzco ahumado en las partes inferiores. Es un animal diurno, muy activo, solitario y territorial. Se alimenta principalmente de semillas y frutos, incluso con endocarpio lignificado como es el caso de las palmeras, guardando una estrecha relación con la pindó (Syagrus romanzoffiana), demostrando la especialización de esta ardilla en el consumo de frutos zoocóricos.', '', 2, NULL),
(7, 'Leopardus wiedii', 'Margay', 'Es muy similar al ocelote, con menor tamaño (entre 40 y 60 cm de cabeza y cuerpo) y un peso promedio de 3,5 kg. Ojos grandes y cola muy larga (puede medir más del 70% de la longitud de la cabeza y cuerpo). Estas son características de su adaptación para la vida arbórea.', 'Casi amenazado', 2, NULL),
(8, 'Dromiciops gliroides', 'Monito de monte', 'Los monitos de monte son animales pequeños, de unos 20-25 cm desde el hocico hasta la cola, de los cuales entre 9 y 13 cm son de la cola. Pesan entre 20 y 42 gramos. Poseen hocico corto y ojos grandes y oscuros. El color del pelo es marrón a pardo grisáceo en el dorso y blanco o gris en el vientre, los hombros y las patas. Las hembras poseen un marsupio con cuatro mamas en su interior. La cola es prensil.\r\nEs un animal trepador y se lo encuentra activo por la noche y el crepúsculo, cuando se alimenta de insectos principalmente (insectívoro) aunque también consume frutos, semillas y hojas. Aunque se lo describe como solitario, duerme en grupos de 3 a 5 individuos, en huecos o matorrales. Las hembras tienen de una a cinco crías entre noviembre y marzo. El desarrollo ocurre dentro del marsupio, por lo cual sólo hasta cuatro crías son viables. Cuando abandonan el marsupio son llevadas por la madre en la espalda y duermen en un nido que hace la madre con hojas de la planta coligüe. Pueden llegar a hibernar en inviernos rigurosos.', NULL, 1, NULL),
(9, 'Eugralla paradoxa', 'Churrín grande', 'Pequeña, mide 14,5 cm de longitud y pesa entre 25 y 30 g.​ Las patas son amarillas. El pico es robusto con el culmen abultado, de color negro. Por arriba es gris oscuro apizarrado; el lomo y las supracaudales con tonos café rufo con tintes amarillentos. Las alas del mismo tono del dorso. El pecho es gris apizarrado más claro que el dorso, especialmente hacia las partes centrales. Ábdomen, flancos y subcaudales rojizo claro con tinte amarillento hacia el ábdomen.8​ Los inmaduros son más pardos y escamados.', NULL, 1, NULL),
(10, 'Trogon curucui', 'Surucuá aurora', 'Trogon pequeño de vientre rojo. El macho tiene la cabeza azul y un anillo ocular amarillo. La hembra tiene la cabeza gris y un anillo ocular blanco prominente. Se encuentra en una variedad de hábitats en el borde de bosques, desde várzea y bosque de llanuras aluviales hasta bordes de bosques jóvenes alrededor de áreas agrícolas. Particularmente común en áreas pantanosas en la parte occidental de su rango; en la parte oriental de su rango ocupa una variedad más amplia de hábitats, incluyendo el bosque semihúmedo. Escucha por una serie rápida y ligeramente en aceleración de notas \"pou\" a un ritmo de aproximadamente 5 notas por segundo.', 'Preocupación menor', 3, 'https://sib.gob.ar/api/2.0.0/resized?filename=20181109133938_Trogon_curucui_de_Lotfi_Si_Saber.jpg&size=700'),
(11, 'Hippocamelus antisensis', 'Taruca', 'Es un mamífero en peligro de extinción perteneciente a la familia Cervidae, que habita las escarpas andinas, y sistemas orográficos próximos, en Sudamérica. Una especie estrechamente emparentada es el huemul del sur, con el cual tiene bastante similitud de aspecto (la taruca es más esbelta y de menor alzada). Taruca también es el nombre de la especie en lenguas aimara y quechua, y aunque no son lenguas relacionadas, en ambas significa venado. El nombre científico genérico significa \"caballo-camello\", porque al describirlo por primera vez se dudaba de su ubicación taxonómica.\r\nEs un ungulado de tamaño mediano y corpulento, de peso entre 45 y alrededor de 60 kg, altura a la cruz de 69 a 80 cm y 140 cm contando la cabeza y las astas, con los menores tamaños y pesos correspondientes a las hembras. El pelaje es de color general gris arena a marrón grisáceo y está compuesto de pelos huecos y gruesos, con pelos cobertores cercanos a la piel.​ La cara tiene marcas negras distintivas, que se diferencian entre individuos, y son más notorias y en forma de V o Y en machos.', 'Vulnerable', 3, NULL),
(27, 'Sicalis flaveola', 'Saffron Finch, Tanagers, Perching Birds,', '', '', 69, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(28, 'Tachuris rubrigastra', 'Many-colored Rush-Tyrant', '', 'Preocupación menor', 69, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(29, 'Tachycineta leucopyga', 'Chilean Swallow, Perching Birds, Birds, ', '', 'Preocupación menor', 69, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(30, 'Tachycineta leucorrhoa', 'White-rumped Swallow, Perching Birds', '', 'Preocupación menor', 69, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(31, 'Thraupis bonariensis', 'Tanagers, Perching Birds', '', '', 69, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(32, 'Tyto furcata', 'Barn Owl, Barn-Owls, Goatsuckers, Birds,', '', '', 69, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(33, 'Serpophaga nigricans', 'Sooty Tyrannulet, Tyrant Flycatchers', '', 'Preocupación menor', 69, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(34, 'Upucerthia dumetaria', 'Scale-throated Earthcreeper', '', '', 69, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(35, 'Xolmis cinereus', 'Grey Monjita', '', 'Preocupación menor', 82, 'https://observation.org/photos/5859616.jpg'),
(36, 'Sterna trudeaui', '', '', 'Preocupación menor', 82, 'http://arctos.database.museum/media/10221409?open'),
(37, 'Ramnogaster arcuata', '', '', 'Preocupación menor', 82, 'https://www.morphosource.org/media/morphosource/images/8/0/6/48678_ms_media_files_media_80670_large.jpg'),
(38, 'Pyrocephalus rubinus', 'Scarlet Flycatcher', '', 'Preocupación menor', 82, 'https://observation.org/photos/12854448.jpg'),
(39, 'Pseudoscops clamator', '', '', '', 82, 'http://arctos.database.museum/media/10305358?open'),
(40, 'Sicalis luteola', '', '', 'Preocupación menor', 82, 'http://arctos.database.museum/media/10305912?open'),
(41, 'Spinus magellanicus', '', '', '', 82, 'http://arctos.database.museum/media/10305346?open'),
(42, 'Syrigma sibilatrix', '', '', '', 82, 'http://arctos.database.museum/media/10305312?open'),
(44, 'Zonotrichia capensis', '', '', 'Preocupación menor', 82, 'http://arctos.database.museum/media/10305257?open'),
(45, 'Rhea americana', 'Greater Rhea', '', 'Casi amenazada', 82, 'https://observation.org/photos/969879.jpg'),
(46, 'Tringa flavipes', 'Lesser Yellowlegs', '', 'Preocupación menor', 69, 'https://observation.org/photos/969973.jpg'),
(47, 'Spartonoica maluroides', '', '', 'Casi amenazada', 69, 'http://mczbase.mcz.harvard.edu/specimen_images/ornithology/large/MCZ_77273_Spartonoica_maluroides_l.JPG'),
(48, 'Pseudoseisura gutturalis', 'White-throated Cacholote, Perching Birds', '', '', 69, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(49, 'Stenocercus azureus', 'Tropidurid Lizards, Iguanas', '', 'Preocupación menor', 69, 'https://images.collections.yale.edu/iiif/2/ypm:e8f81173-9bf2-4ab7-bb6c-505530041338/full/full/0/default.jpg'),
(50, 'Thinocorus rumicivorus', '', '', 'Preocupación menor', 69, 'https://mediaphoto.mnhn.fr/media/1567760900214b6j1zYiCVeccOmfs'),
(51, 'Xolmis coronatus', 'Black-crowned Monjita, Tyrant Flycatcher', '', '', 69, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(52, 'Xolmis irupero', 'White Monjita, Tyrant Flycatchers, Perch', '', '', 69, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(53, 'Xolmis rubetra', 'Rusty-backed Monjita, Tyrant Flycatchers', '', 'Preocupación menor', 69, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(55, 'Synbranchus marmoratus', '', '', 'Preocupación menor', 69, 'http://monarch.calacademy.org/mnt/target-images/CASICH/SU31616-r.jpg'),
(56, 'Vanellus chilensis', 'Southern Lapwing', '', 'Preocupación menor', 69, 'https://observation.org/photos/19019827.jpg'),
(57, 'Spiziapteryx circumcincta', 'Spot-winged Falconet, Caracaras', '', 'Preocupación menor', 69, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(58, 'Agriornis andicola', '', '', 'Vulnerable', 80, 'http://mczbase.mcz.harvard.edu/specimen_images/ornithology/large/MCZ_99389_Agriornis_andicola_albicauda_d.jpg'),
(59, 'Chacophrys pierottii', '', '', '', 80, 'http://www.archive.org/stream/catalogueofsp03unse#page/n133/mode/2up'),
(60, 'Eudromia elegans', '', '', '', 80, 'http://mczbase.mcz.harvard.edu/specimen_images/ornithology/large/MCZ_99095_Eudromia_elegans_intermedia_d.jpg'),
(61, 'Vanellus resplendens', 'Andean Lapwing, Plovers, Alcids, Birds, ', '', 'Preocupación menor', 80, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(62, 'Elachistocleis ovalis', '', '', 'Preocupación menor', 57, 'http://www.morphosource.org/media/000367959/thumbnail'),
(63, 'Rhinella dorbignyi', '', '', 'Preocupación menor', 87, 'http://www.archive.org/stream/catalogueofsp03unse#page/n133/mode/2up'),
(64, 'Cerdocyon thous', 'Crab-eating Fox', '', 'Preocupación menor', 87, 'https://observation.org/photos/24574942.jpg'),
(65, 'Aramus guarauna', 'Limpkin', '', 'Preocupación menor', 87, 'https://observation.org/photos/975419.jpg'),
(66, 'Mycteria americana', 'Wood Stork', '', 'Preocupación menor', 87, 'https://observation.org/photos/975417.jpg'),
(67, 'Leptodactylus chaquensis', '', '', 'Preocupación menor', 87, 'http://www.archive.org/stream/catalogueofdepar16unse#page/n327/mode/2up'),
(68, 'Pithecopus hypochondrialis', '', '', '', 87, 'http://www.archive.org/stream/catalogueofdepar16unse#page/n329/mode/2up'),
(69, 'Rhinella major', '', '', '', 87, 'http://www.archive.org/stream/catalogueofdepar17unse#page/n305/mode/2up'),
(70, 'Rhinella pygmaea', '', '', 'Preocupación menor', 87, 'http://www.archive.org/stream/catalogueofdepar17unse#page/n305/mode/2up'),
(71, 'Agriornis micropterus', 'Grey-bellied Shrike-Tyrant', '23 cm. Pardo.  Se puede diferenciar del cacholote pardo por ser de menor tamalo y tener garganta blanca con estrías negras; del gaucho chico se diferencia por ser de mayor tamaño y tener pico fuerte terminado en gancho, cubiertas oscuras. De los demás gauchos se diferencia por tener ceja clara; alas y cola negruzcas con rebordes claros y del zorzal: por el pico y patas oscuros.', 'Preocupación menor', 51, 'https://observation.org/photos/6031742.jpg'),
(72, 'Asthenes pyrrholeuca', 'Lesser Canastero, Perching Birds, Birds,', '', '', 51, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(73, 'Athene cunicularia', 'Burrowing Owl', '', 'Preocupación menor', 51, 'https://observation.org/photos/5860406.jpg'),
(74, 'Cathartes aura', 'Turkey Vulture', '', 'Preocupación menor', 51, 'https://observation.org/photos/5816695.jpg'),
(75, 'Chaetophractus villosus', 'Large Hairy Armadillo', '', 'Preocupación menor', 51, 'https://observation.org/photos/970804.jpg'),
(76, 'Dolichotis patagonum', 'Patagonian Cavy', '', 'Casi amenazada', 51, 'https://observation.org/photos/25018621.jpg'),
(77, 'Eleginops maclovinus', 'Antarctic blennies, perch-like fishes', '', '', 51, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(78, 'Eubalaena australis', 'Southern Right Whale', '', 'Preocupación menor', 51, 'https://observation.org/photos/5865829.jpg'),
(79, 'Haematopus ater', 'Blackish Oystercatcher', '', 'Preocupación menor', 51, 'https://observation.org/photos/19205660.jpg'),
(80, 'Lophonetta specularioides', 'Crested Duck', '', 'Preocupación menor', 51, 'https://observation.org/photos/24351922.jpg'),
(81, 'Lycalopex culpaeus', 'Culpeo', '', 'Preocupación menor', 51, 'https://observation.org/photos/2969525.jpg'),
(82, 'Lycalopex gymnocercus', 'South American Grey Fox', '', 'Preocupación menor', 75, 'https://observation.org/photos/25096856.jpg'),
(83, 'Milvago chimango', 'Chimango Caracara', '', 'Preocupación menor', 75, 'https://observation.org/photos/5818593.jpg'),
(84, 'Mimus patagonicus', 'Patagonian Mockingbird', '', 'Preocupación menor', 75, 'https://observation.org/photos/1009976.jpg'),
(85, 'Mirounga leonina', 'Southern Elephant Seal', '', 'Preocupación menor', 75, 'https://observation.org/photos/1552657.jpg'),
(86, 'Nycticorax nycticorax', 'Black-crowned Night Heron', '', 'Preocupación menor', 75, 'https://observation.org/photos/25019337.jpg'),
(87, 'Orcinus orca', 'Killer Whale ecotype A', '', 'Datos insuficientes', 75, 'https://observation.org/photos/25018713.jpg'),
(88, 'Otaria byronia', 'South American Sea Lion', '', 'Preocupación menor', 75, 'https://observation.org/photos/1552662.jpg'),
(89, 'Phalacrocorax brasilianus', 'Neotropic Cormorant', '', 'Preocupación menor', 75, 'https://observation.org/photos/25070182.jpg'),
(90, 'Phalacrocorax magellanicus', 'Rock Shag', '', 'Preocupación menor', 75, 'https://observation.org/photos/5818244.jpg'),
(91, 'Phrygilus fruticeti', 'Mourning Sierra Finch', '', 'Preocupación menor', 75, 'https://observation.org/photos/523666.jpg'),
(92, 'Podiceps occipitalis', 'Silvery Grebe', '', 'Preocupación menor', 75, 'https://observation.org/photos/24351949.jpg'),
(93, 'Progne elegans', 'Southern Martin', '', 'Preocupación menor', 75, 'https://observation.org/photos/5816728.jpg'),
(94, 'Rhea pennata', 'Lesser Rhea', '', 'Preocupación menor', 75, 'https://observation.org/photos/19327660.jpg'),
(95, 'Sturnella loyca', 'Long-tailed Meadowlark', '', 'Preocupación menor', 75, 'https://observation.org/photos/25018797.jpg'),
(96, 'Turdus chiguanco', 'Chiguanco Thrush', '', 'Preocupación menor', 75, 'https://observation.org/photos/24351946.jpg'),
(97, 'Megaceryle torquata', 'Ringed Kingfisher', '', 'Preocupación menor', 75, 'https://observation.org/photos/1443658.jpg'),
(98, 'Podilymbus podiceps', 'Pied-billed Grebe', '', 'Preocupación menor', 75, 'https://observation.org/photos/1443603.jpg'),
(99, 'Eremobius phoenicurus', 'Band-tailed Earthcreeper, Perching Birds', '', 'Preocupación menor', 75, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(100, 'Lama glama', 'Guanaco', '', 'Preocupación menor', 75, 'https://observation.org/photos/19205687.jpg'),
(101, 'Larus dominicanus', 'Kelp Gull', '', 'Preocupación menor', 75, 'https://observation.org/photos/5819176.jpg'),
(102, 'Oreopholus ruficollis', 'Tawny-throated Dotterel, Plovers, Alcids', '', '', 75, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(103, 'Tachyeres leucocephalus', 'Chubut Steamer Duck', '', 'Vulnerable', 75, 'https://observation.org/photos/4265598.jpg'),
(104, 'Anas cyanoptera', 'Cinnamon Teal', '', 'Preocupación menor', 75, 'https://observation.org/photos/4268833.jpg'),
(105, 'Anas georgica', 'Yellow-billed Pintail', '', 'Preocupación menor', 75, 'https://observation.org/photos/4265664.jpg'),
(107, 'Netta peposaca', 'Rosy-billed Pochard', '', 'Preocupación menor', 75, 'https://observation.org/photos/4265633.jpg'),
(109, 'Phoenicopterus chilensis', 'Chilean Flamingo', '', 'Casi amenazada', 75, 'https://observation.org/photos/1631283.jpg'),
(110, 'Geranoaetus melanoleucus', 'Black-chested Buzzard-Eagle', '', 'Preocupación menor', 75, 'https://observation.org/photos/523647.jpg'),
(111, 'Theristicus melanopis', 'Black-faced Ibis', '', 'Preocupación menor', 75, 'https://observation.org/photos/3017986.jpg'),
(112, 'Liolaemus multimaculatus', '', '', 'En peligro', 75, 'http://mczbase.mcz.harvard.edu/specimen_images/herpetology/thumbnails/R3950_L_multimaculatus_S_hl.jpg'),
(113, 'Spinus uropygialis', 'Yellow-rumped Siskin, Finches, Perching ', '', 'Preocupación menor', 75, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(115, 'Anas flavirostris', 'Yellow-billed Teal', '', 'Preocupación menor', 75, 'https://observation.org/photos/6031476.jpg'),
(116, 'Anthus correndera', 'Correndera Pipit', '', 'Preocupación menor', 75, 'https://observation.org/photos/5854219.jpg'),
(117, 'Chroicocephalus maculipennis', 'Brown-hooded Gull', '', '', 75, 'https://observation.org/photos/5822089.jpg'),
(118, 'Circus cinereus', 'Cinereous Harrier', '', 'Preocupación menor', 75, 'https://observation.org/photos/6031422.jpg'),
(119, 'Columbina picui', 'Picui Ground Dove', '', 'Preocupación menor', 75, 'https://observation.org/photos/6030975.jpg'),
(120, 'Coscoroba coscoroba', 'Coscoroba Swan', '', 'Preocupación menor', 75, 'https://observation.org/photos/5822077.jpg'),
(121, 'Cygnus melancoryphus', 'Black-necked Swan', '', 'Preocupación menor', 75, 'https://observation.org/photos/5861755.jpg'),
(122, 'Diuca diuca', 'Common Diuca Finch', '', 'Preocupación menor', 75, 'https://observation.org/photos/6031591.jpg'),
(123, 'Fulica armillata', 'Red-gartered Coot', '', 'Preocupación menor', 75, 'https://observation.org/photos/6031070.jpg'),
(124, 'Fulica leucoptera', 'White-winged Coot', '', 'Preocupación menor', 75, 'https://observation.org/photos/6031088.jpg'),
(125, 'Fulica rufifrons', 'Red-fronted Coot, Coots, Cranes, Birds, ', '', 'Preocupación menor', 75, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(126, 'Geositta antarctica', 'Short-billed Miner, Perching Birds, Bird', '', 'Preocupación menor', 75, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(127, 'Haematopus palliatus', 'American Oystercatcher', '', 'Preocupación menor', 75, 'https://observation.org/photos/5862057.jpg'),
(128, 'Himantopus melanurus', 'White-backed Stilt', '', '', 51, 'https://observation.org/photos/5822524.jpg'),
(129, 'Himantopus mexicanus', 'Black-necked Stilt', '', 'Preocupación menor', 51, 'https://observation.org/photos/5861946.jpg'),
(130, 'Leptasthenura aegithaloides', 'Plain-mantled Tit-Spinetail', '', '', 51, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(131, 'Oxyura vittata', 'Lake Duck', '', 'Preocupación menor', 51, 'https://observation.org/photos/5822226.jpg'),
(132, 'Phrygilus carbonarius', 'Carbonated Sierra Finch', '', 'Preocupación menor', 51, 'https://observation.org/photos/5854359.jpg'),
(133, 'Plegadis chihi', 'White-faced Ibis', '', 'Preocupación menor', 51, 'https://observation.org/photos/5861775.jpg'),
(134, 'Podiceps major', 'Great Grebe', '', 'Preocupación menor', 51, 'https://observation.org/photos/5822159.jpg'),
(135, 'Rollandia rolland', 'White-tufted Grebe', '', 'Preocupación menor', 51, 'https://observation.org/photos/5822713.jpg'),
(136, 'Spheniscus magellanicus', 'Magellanic Penguin', '', 'Preocupación menor', 51, 'https://observation.org/photos/10249620.jpg'),
(137, 'Calidris bairdii', 'Baird\'s Sandpiper, Sandpipers, Alcids, B', '', 'Preocupación menor', 51, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(138, 'Neoxolmis rufiventris', 'Chocolate-vented Tyrant, Tyrant Flycatch', '', 'Preocupación menor', 51, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(139, 'Tinamotis ingoufi', 'Patagonian Tinamou, Tinamous, Birds, ver', '', 'Preocupación menor', 51, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(140, 'Buteo polyosoma', 'Eagles, Hawks, Birds, vertebrates, chord', '', '', 51, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(141, 'Geositta cunicularia', 'Common Miner, Perching Birds', '', '', 51, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(142, 'Basilinna leucotis', 'White-eared Hummingbird, Hummingbirds, B', '', '', 51, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(144, 'Agelaioides badius', 'Greyish Baywing', '', 'Preocupación menor', 69, 'https://observation.org/photos/2790028.jpg'),
(145, 'Amazonetta brasiliensis', 'Brazilian Teal', '', 'Preocupación menor', 69, 'https://observation.org/photos/15594919.jpg'),
(148, 'Anumbius annumbi', '', '', 'Preocupación menor', 69, 'http://arctos.database.museum/media/10577129?open'),
(149, 'Aramides cajanea', 'Grey-necked Wood Rail', '', 'Preocupación menor', 69, 'https://observation.org/photos/15594949.jpg'),
(150, 'Aramides ypecaha', 'Giant Wood Rail', '', 'Preocupación menor', 69, 'https://observation.org/photos/20194535.jpg'),
(151, 'Ardea alba', 'American Great Egret', '', '', 69, 'https://observation.org/photos/15580837.jpg'),
(152, 'Ardea herodias', 'Great Blue Heron', '', 'Preocupación menor', 69, 'https://observation.org/photos/20194433.jpg'),
(153, 'Callonetta leucophrys', 'Ringed Teal', '', 'Preocupación menor', 69, 'https://observation.org/photos/20194421.jpg'),
(154, 'Caracara plancus', 'Southern Crested Caracara', '', 'Preocupación menor', 69, 'https://observation.org/photos/16016584.jpg'),
(155, 'Cavia aperea', 'Brazilian Guinea Pig', '', 'Preocupación menor', 69, 'https://observation.org/photos/2872226.jpg'),
(156, 'Chauna torquata', '', '', 'Preocupación menor', 69, 'https://static.inaturalist.org/photos/62121779/medium.jpeg?1582576773'),
(157, 'Chloroceryle americana', 'Green Kingfisher, Kingfishers', '', '', 69, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(158, 'Chlorostilbon lucidus', 'Glittering-bellied Emerald', '', 'Preocupación menor', 69, 'https://observation.org/photos/2786981.jpg'),
(159, 'Ciconia maguari', 'Maguari Stork', '', 'Preocupación menor', 69, 'https://observation.org/photos/23053105.jpg'),
(160, 'Coccyzus melacoryphus', 'Dark-billed Cuckoo', '', 'Preocupación menor', 69, 'https://observation.org/photos/2786919.jpg'),
(162, 'Columba livia', 'Feral Pigeon', '', '', 69, 'https://observation.org/photos/20194184.jpg'),
(163, 'Crenicichla scottii', '', '', '', 69, 'http://monarch.calacademy.org/mnt/target-images/CASICH/66891-r.jpg'),
(164, 'Dendrocygna bicolor', 'Fulvous Whistling Duck', '', 'Preocupación menor', 69, 'https://observation.org/photos/20194404.jpg'),
(165, 'Dendrocygna viduata', 'White-faced Whistling Duck', '', 'Preocupación menor', 69, 'https://observation.org/photos/1286043.jpg'),
(166, 'Didelphis albiventris', 'White-eared Opossum', '', 'Preocupación menor', 69, 'https://observation.org/photos/16015393.jpg'),
(167, 'Egretta thula', 'Snowy Egret', '', 'Preocupación menor', 69, 'https://observation.org/photos/19021283.jpg'),
(168, 'Embernagra platensis', 'Pampa Finch', '', 'Preocupación menor', 69, 'https://observation.org/photos/2789942.jpg'),
(169, 'Furnarius rufus', '', '', '', 69, 'http://arctos.database.museum/media/10576412?open'),
(170, 'Gallinula chloropus', 'Common Gallinule', '', 'Preocupación menor', 69, 'https://observation.org/photos/1736313.jpg'),
(171, 'Geothlypis velata', 'Southern Yellowthroat', '', '', 69, 'https://observation.org/photos/2787172.jpg'),
(172, 'Guira guira', 'Guira Cuckoo', '', 'Preocupación menor', 69, 'https://observation.org/photos/1286087.jpg'),
(173, 'Hymenops perspicillatus', 'Spectacled Tyrant', '', 'Preocupación menor', 69, 'https://observation.org/photos/2790056.jpg'),
(174, 'Hypostomus laplatae', '', '', '', 69, 'http://monarch.calacademy.org/mnt/target-images/CASICH/77342-p.jpg'),
(175, 'Jacana jacana', 'Wattled Jacana', '', 'Preocupación menor', 69, 'https://observation.org/photos/1286065.jpg'),
(176, 'Limosa haemastica', 'Hudsonian Godwit, Sandpipers', '', 'Preocupación menor', 69, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(177, 'Machetornis rixosa', '', '', '', 69, 'http://arctos.database.museum/media/10576421?open'),
(178, 'Melopsittacus undulatus', 'Budgerigar', '', 'Preocupación menor', 69, 'https://observation.org/photos/24658403.jpg'),
(180, 'Myiopsitta monachus', 'Monk Parakeet', '', 'Preocupación menor', 69, 'https://observation.org/photos/19021152.jpg'),
(182, 'Nandayus nenday', 'Nanday Parakeet', '', 'Preocupación menor', 69, 'https://observation.org/photos/5685347.jpg'),
(183, 'Nothura maculosa', 'Spotted Nothura, Tinamous, Birds, verteb', '', 'Preocupación menor', 69, 'https://images.collections.yale.edu/iiif/2/ypm:c6ece5f4-e1eb-4909-8d97-d44e411d6eb1/full/full/0/default.jpg'),
(184, 'Parabuteo unicinctus', 'Harris\'s Hawk', '', 'Preocupación menor', 69, 'https://observation.org/photos/23000579.jpg'),
(185, 'Pardirallus sanguinolentus', 'Plumbeous Rail', '', 'Preocupación menor', 69, 'https://observation.org/photos/3991571.jpg'),
(186, 'Paroaria capitata', 'Yellow-billed Cardinal', '', 'Preocupación menor', 69, 'https://observation.org/photos/20194525.jpg'),
(187, 'Paroaria coronata', '', '', 'Preocupación menor', 69, 'https://static.inaturalist.org/photos/62122760/medium.jpeg?1582577828'),
(188, 'Passer domesticus', 'House Sparrow', '', 'Preocupación menor', 69, 'https://observation.org/photos/20194529.jpg'),
(189, 'Patagioenas picazuro', '', '', '', 69, 'http://arctos.database.museum/media/10576324?open'),
(190, 'Pitangus sulphuratus', '', '', '', 69, 'http://arctos.database.museum/media/10576455?open'),
(191, 'Polioptila dumicola', 'Masked Gnatcatcher', '', 'Preocupación menor', 69, 'https://observation.org/photos/2787134.jpg'),
(192, 'Poospiza nigrorufa', 'Black-and-rufous Warbling Finch', '', 'Preocupación menor', 69, 'https://observation.org/photos/2787178.jpg'),
(193, 'Progne chalybea', 'Grey-breasted Martin', '', 'Preocupación menor', 69, 'https://observation.org/photos/2787100.jpg'),
(194, 'Progne tapera', 'Brown-chested Martin', '', 'Preocupación menor', 69, 'https://observation.org/photos/2787116.jpg'),
(195, 'Pyrocephalus obscurus', 'Vermilion Flycatcher', '', '', 69, 'https://observation.org/photos/25406942.jpg'),
(196, 'Rupornis magnirostris', 'Roadside Hawk', '', 'Preocupación menor', 69, 'https://observation.org/photos/24658377.jpg'),
(197, 'Saltator aurantiirostris', 'Golden-billed Saltator', '', 'Preocupación menor', 69, 'https://observation.org/photos/15594921.jpg'),
(198, 'Satrapa icterophrys', 'Yellow-browed Tyrant', '', 'Preocupación menor', 69, 'https://observation.org/photos/4112742.jpg'),
(199, 'Sporophila caerulescens', 'Double-collared Seedeater', '', 'Preocupación menor', 69, 'https://observation.org/photos/2787174.jpg'),
(200, 'Sturnus vulgaris', 'Common Starling', '', 'Preocupación menor', 69, 'https://observation.org/photos/20194465.jpg'),
(201, 'Tigrisoma lineatum', 'Rufescent Tiger Heron', '', 'Preocupación menor', 69, 'https://observation.org/photos/23053014.jpg'),
(202, 'Tupinambis teguixin', 'Black Tegu', '', 'Preocupación menor', 69, 'https://observation.org/photos/2872388.jpg'),
(203, 'Turdus rufiventris', 'Rufous-bellied Thrush', '', 'Preocupación menor', 69, 'https://observation.org/photos/1736814.jpg'),
(204, 'Tyrannus savana', 'Fork-tailed Flycatcher', '', 'Preocupación menor', 69, 'https://observation.org/photos/2787085.jpg'),
(205, 'Lepidobatrachus laevis', '', '', 'Preocupación menor', 72, 'https://www.morphosource.org/media/000068634/thumbnail'),
(206, 'Falco femoralis', 'Aplomado Falcon', '', 'Preocupación menor', 3, 'https://observation.org/photos/1665749.jpg'),
(207, 'Phyllotis caprinus', '', '', 'Preocupación menor', 74, 'http://arctos.database.museum/media/10472947?open'),
(208, 'Monodelphis dimidiata', '', '', 'Preocupación menor', 64, 'https://www.nhm.ac.uk/services/media-store/asset/5c3d013036227bc1c8bd9fc12251c1686391f299/contents/preview'),
(210, 'Chlamyphorus truncatus', '', '', 'Datos insuficientes', 65, 'http://mczbase.mcz.harvard.edu/specimen_images/mammalogy/thumbnails/MCZ_3207_Chlamyphorus_truncatus_skull_dorsal_1.jpg'),
(211, 'Potamotrygon motoro', '', '', 'Datos insuficientes', 2, 'http://fm-digital-assets.fieldmuseum.org/702/442/FMNH_84658_Potamotrygon_motoro_dorsal_view_X869_F0002520.jpg'),
(212, 'Astyanax ojiara', '', '', '', 2, 'http://fm-digital-assets.fieldmuseum.org/653/623/98319_Astyanax_uncinatus_FZ.JPG'),
(214, 'Falco sparverius', 'American Kestrel', '', 'Preocupación menor', 52, 'https://observation.org/photos/1317605.jpg'),
(215, 'Ctenomys sociabilis', '', '', 'En peligro crítico', 63, 'http://arctos.database.museum/media/10472905?open'),
(217, 'Liolaemus bellii', '', '', 'Preocupación menor', 63, 'http://arctos.database.museum/media/10434717?open'),
(218, 'Conepatus humboldtii', '', '', '', 4, 'http://mczbase.mcz.harvard.edu/specimen_images/mammalogy/large/19114_Conepatus_humboldtii_d.jpg'),
(219, 'Phrygilus alaudinus', 'Band-tailed Sierra Finch', '', 'Preocupación menor', 56, 'https://observation.org/photos/1664380.jpg'),
(220, 'Corydoras micracanthus', '', '', '', 56, 'https://www.nhm.ac.uk/services/media-store/asset/7d2c15f7e955515d6c83eaba9edeaeda905506c7/contents/preview'),
(221, 'Dermatonotus muelleri', '', '', 'Preocupación menor', 53, 'http://mczbase.mcz.harvard.edu/specimen_images/herpetology/thumbnails/A136486_D_muelleri_dx.jpg'),
(222, 'Pseudis paradoxa', '', '', 'Preocupación menor', 53, 'https://www.morphosource.org/media/000043504/thumbnail'),
(223, 'Saltator coerulescens', 'Greyish Saltator', '', 'Preocupación menor', 76, 'https://observation.org/photos/1667789.jpg'),
(225, 'Lessonia rufa', 'Austral Negrito', '', 'Preocupación menor', 54, 'https://observation.org/photos/5825792.jpg'),
(226, 'Pluvianellus socialis', 'Magellanic Plover', '', 'Casi amenazada', 54, 'https://observation.org/photos/3512989.jpg'),
(227, 'Chloephaga rubidiceps', 'Ruddy-headed Goose', '', 'Preocupación menor', 81, 'https://observation.org/photos/18027773.jpg'),
(228, 'Anairetes parulus', 'Tufted Tit-Tyrant', '', 'Preocupación menor', 81, 'https://observation.org/photos/6094265.jpg'),
(229, 'Aphrastura spinicauda', 'Thorn-tailed Rayadito', '', 'Preocupación menor', 81, 'https://observation.org/photos/6137970.jpg'),
(230, 'Campephilus magellanicus', 'Magellanic Woodpecker', '', 'Preocupación menor', 81, 'https://observation.org/photos/16208606.jpg'),
(231, 'Chloephaga hybrida', 'Kelp Goose', '', 'Preocupación menor', 81, 'https://observation.org/photos/12958759.jpg'),
(232, 'Chloephaga poliocephala', 'Ashy-headed Goose', '', 'Preocupación menor', 81, 'https://observation.org/photos/3706796.jpg'),
(233, 'Elaenia chilensis', 'Chilean Elaenia', '', '', 81, 'https://observation.org/photos/6095826.jpg'),
(234, 'Haematopus leucopodus', 'Magellanic Oystercatcher', '', 'Preocupación menor', 81, 'https://observation.org/photos/8813536.jpg'),
(235, 'Leucophaeus scoresbii', 'Dolphin Gull', '', 'Preocupación menor', 81, 'https://observation.org/photos/17992501.jpg'),
(236, 'Melanodera xanthogramma', 'Yellow-bridled Finch', '', 'Preocupación menor', 81, 'https://observation.org/photos/3624171.jpg'),
(237, 'Phalcoboenus albogularis', 'White-throated Caracara', '', 'Preocupación menor', 81, 'https://observation.org/photos/18031366.jpg'),
(238, 'Phrygilus gayi', 'Grey-hooded Sierra Finch ssp caniceps', '', '', 81, 'https://observation.org/photos/18053548.jpg'),
(239, 'Pygarrhichas albogularis', 'White-throated Treerunner', '', 'Preocupación menor', 81, 'https://observation.org/photos/8813584.jpg'),
(240, 'Thalassarche melanophris', 'Black-browed Albatross', '', 'Preocupación menor', 81, 'https://observation.org/photos/12854805.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parquenacional`
--

CREATE TABLE `parquenacional` (
  `id_PN` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `region` varchar(30) NOT NULL,
  `ubicacion` varchar(30) NOT NULL,
  `anio_creacion` int(11) DEFAULT NULL,
  `superficie` int(11) DEFAULT NULL,
  `img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `parquenacional`
--

INSERT INTO `parquenacional` (`id_PN`, `nombre`, `region`, `ubicacion`, `anio_creacion`, `superficie`, `img`) VALUES
(1, 'PN Lanín', 'PATAGONIA', 'Neuquén', 1937, 412000, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_lanin.png'),
(2, 'PN Iguazú', 'NEA', 'Misiones', 1934, 67670, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_iguazu.png'),
(3, 'PN Calilegua', 'NOA', 'Jujuy', 1979, 76603, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_calilegua.png'),
(4, 'PN Nahuel Huapi', 'PATAGONIA', 'Río Negro', 1934, 717261, 'https://www.argentina.gob.ar/sites/default/files/emblema_-_pn_nahuel_huapi.png'),
(50, 'PN Aconquija', 'NOA', 'Tucuman', 2018, 76207, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_aconquija.png'),
(51, 'PN Los Alerces', 'PATAGONIA', 'Chubut', 1937, 259822, 'https://www.argentina.gob.ar/sites/default/files/emblema_-_pn_los_alerces.png'),
(52, 'PN Los Arrayanes', 'PATAGONIA', 'Neuquen', 1971, 1796, 'https://www.argentina.gob.ar/sites/default/files/emblema_-_pn_los_arrayanes.png'),
(53, 'PN Baritú', 'NOA', 'Salta', 1974, 72439, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_baritu.png'),
(54, 'PN Bosques Petrificados de Jaramillo', 'PATAGONIA', 'Santa Cruz', 1954, 78543, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_bosques_petrificados_de_jaramillo.png'),
(55, 'Reserva Natural Educativa Colonia Benítez', 'NEA', 'Chaco', 1990, 8, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_rne_colonia_benitez.png'),
(56, 'PN Los Cardones', 'NOA', 'Salta', 1996, 64117, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_los_cardones.png'),
(57, 'PN Chaco', 'NEA', 'Chaco', 1954, 14981, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_chaco.png'),
(58, 'PN Quebrada del Condorito', 'CENTRO', 'Cordoba', 1996, 35396, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_quebrada_del_condorito.png'),
(59, 'PN Copo', 'NOA', 'Santiago Del Estero', 2000, 118119, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_copo.png'),
(60, 'Reserva Natural Formosa', 'NOA', 'Formosa', 1968, 9005, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_rn_formosa.png'),
(62, 'Reserva Nacional Pizarro', 'NOA', 'Salta', 2015, 7837, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_rn_pizarro.png'),
(63, 'PN Laguna Blanca', 'PATAGONIA', 'Neuquen', 1940, 11250, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_laguna_blanca.png'),
(64, 'PN Lihué Calel', 'PATAGONIA', 'La Pampa', 1976, 32514, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_lihue_calel.png'),
(65, 'PN El Leoncito', 'CENTRO', 'San Juan', 2002, 89706, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_el_leoncito.png'),
(66, 'PN Mburucuyá', 'NEA', 'Corrientes', 2002, 17086, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_mburucuya.png'),
(67, 'PN Monte León', 'PATAGONIA', 'Santa Cruz', 2004, 62169, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_monte_leon.png'),
(68, 'Reserva Nacional El Nogalar de los Toldos', 'NOA', 'Salta', 2006, 3275, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_rn_el_nogalar_de_los_toldos.png'),
(69, 'PN Ciervo de los Pantanos', 'CENTRO', 'Buenos Aires', 2018, 5200, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_ciervo_de_los_pantanos.png'),
(70, 'PN El Palmar', 'CENTRO', 'Entre Rios', 1965, 8213, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_el_palmar.png'),
(72, 'PN Río Pilcomayo', 'NEA', 'Formosa', 1951, 51889, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_rio_pilcomayo.png'),
(73, 'PN Perito Moreno', 'PATAGONIA', 'Santa Cruz', 1937, 142120, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_perito_moreno.png'),
(74, 'Monumento Natural Laguna de los Pozuelos', 'NOA', 'Jujuy', 1980, 16000, 'https://www.argentina.gob.ar/sites/default/files/emblema_ficha_-_mn_laguna_de_los_pozuelos.png'),
(75, 'PN Lago Puelo', 'PATAGONIA', 'Chubut', 1937, 27674, 'https://www.argentina.gob.ar/sites/default/files/emblema_-_pn_lago_puelo_0.png'),
(76, 'PN El Rey', 'NOA', 'Salta', 1948, 44162, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_el_rey.png'),
(77, 'Reserva Natural Estricta San Antonio', 'NEA', 'Misiones', 1990, 480, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_rne_san_antonio.png'),
(78, 'PN San Guillermo', 'CENTRO', 'San Juan', 1999, 166000, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_san_guillermo.png'),
(79, 'PN Sierra de las Quijadas', 'CENTRO', 'San Luis', 1991, 73785, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_sierra_de_las_quijadas.png'),
(80, 'PN Talampaya', 'CENTRO', 'La Rioja', 1997, 213800, 'https://www.argentina.gob.ar/sites/default/files/pn_talampaya_-_emblema_fichas.png'),
(81, 'PN Tierra del Fuego', 'PATAGONIA', 'Tierra Del Fuego', 1960, 68909, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_tierra_del_fuego.png'),
(82, 'PN Campos del Tuyú', 'CENTRO', 'Buenos Aires', 2008, 3040, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_campos_del_tuyu.png'),
(84, 'PN Islas de Santa Fé', 'CENTRO', 'Santa Fe', 2010, 4096, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_islas_de_santa_fe.png'),
(85, 'Parque Interjurisdiccional Marino Makenke', 'PATAGONIA', 'Santa Cruz', 2012, 72663, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pim_makenke.png'),
(86, 'Parque Interjurisdiccional Marino Isla Pingüino', 'PATAGONIA', 'Santa Cruz', 2012, 159526, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pim_isla_pinguino.png'),
(87, 'PN El Impenetrable', 'NEA', 'Chaco', 2014, 128000, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_el_impenetrable.png'),
(88, 'PN Patagonia', 'PATAGONIA', 'Santa Cruz', 2015, 106424, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pimc_patagonia_austral.png'),
(90, 'PN Iberá', 'NEA', 'Corrientes', 2018, 195094, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_ibera.png'),
(91, 'PN Traslasierra', 'CENTRO', 'Cordoba', 2017, 44168, 'https://www.argentina.gob.ar/sites/default/files/emblema_fichas_-_pn_traslasierra.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `rol` varchar(15) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `clave` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `rol`, `nombre`, `mail`, `clave`) VALUES
(1, 'adm', 'Tomás Rodríguez', 'augustotomasrodriguez@gmail.com', '$2y$10$4p.7jzElKfJCpv13RsOabOFuBs4fRUBaYJVJNkfhTCCeMv8B60.SO'),
(5, '', 'Santiago Rodríguez', 'santiago@gmail.com', '$2y$10$wqwObz4w3VoxA3t0p6097.BgqX.sdvdZhsKM5UJRW82jh8EwWea2u'),
(6, '', 'Marta Lopez', 'marta@gmail.com', '$2y$10$uRq/L4hUrGByGSI264iFY.S.ltjSnwXpOtwxoThT8DircPwCucPz2'),
(7, '', 'Julieta Garcia', 'julietagg@gmail.com', '$2y$10$jzzPRPAl0zh3uhmhrrpFLuZnGiGX.ukyQ8FamB0batpr0fX/lDGQG'),
(8, '', 'Julian Ortiz', 'julianortiz@gmail.com', '$2y$10$9ksy6rUPOa2Tzcjc7OqGweOvNizZbuCr/dGRLvHjcQSuMOhSFeNp.'),
(11, 'user', 'Violeta', 'viole@gmail.com', '$2y$10$CEL1TcQ1gOQgleNihV/EauXV.IDJXFttwyGu4r36E2TDwTFDxxjA.'),
(12, 'adm', 'Sofia Martinez', 'sofim@gmail.com', '$2y$10$jJqA7PENDjdpOb9PXin5jOAOWtfECV9CzmeAiHUmDfAH/FTNKvoOO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `especie`
--
ALTER TABLE `especie`
  ADD PRIMARY KEY (`id_especie`),
  ADD KEY `fk_especie_parquenacional` (`id_parque`);

--
-- Indices de la tabla `parquenacional`
--
ALTER TABLE `parquenacional`
  ADD PRIMARY KEY (`id_PN`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `especie`
--
ALTER TABLE `especie`
  MODIFY `id_especie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT de la tabla `parquenacional`
--
ALTER TABLE `parquenacional`
  MODIFY `id_PN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `especie`
--
ALTER TABLE `especie`
  ADD CONSTRAINT `fk_especie_parquenacional` FOREIGN KEY (`id_parque`) REFERENCES `parquenacional` (`id_PN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
