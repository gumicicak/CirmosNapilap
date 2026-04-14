-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2026 at 10:13 AM
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
-- Database: `news_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `writer_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `date`, `title`, `text`, `writer_id`, `category_id`) VALUES
(1, '2025-03-18 14:32:00', 'Dramatikus ékszerek felrobbannak :o', '1drameksz.jpg- Régen az ékszerek legnagyobb veszélye az volt, hogy leesnek a lefolyóba. Ma viszont már fel is robbanhatnak. Igen, jól olvasod. Az „okos” ékszerek – LED-es gyűrűk, villogó nyakláncok – néha túl komolyan veszik az „energia” szót.\r\nA gond általában az apró akkumulátorral van, amit sikerült belezsúfolni egy ékszerbe, ami kb. akkora, mint egy Tic Tac. Ha túlmelegszik, megsérül vagy rossz töltőt kap, akkor jön a meglepetés.\r\nSzerencsére nem Michael Bay-filmes robbanásokról beszélünk, inkább kisebb pukkanásokról.\r\nTanulság: ha az ékszered töltést kér, zümmög, melegszik, és közben világít – az már nem divat, hanem figyelmeztetés.', 1, 1),
(2, '2025-06-02 09:11:00', 'Feszült szituáció…', '2feszult.jpg- Valamiért minden helyzet feszült. Sorban állás? Feszült. Csoportmunka? Feszült. „Ki ette meg az utolsó joghurtot?” – extrán feszült.\r\nAz ok egyszerű: mindenki fáradt. Kevés az alvás, sok az értesítés, és mindenki siet valahová.\r\nNem ellenünk van a világ, csak túl sok tab van nyitva mindenkinek az agyában.', 1, 1),
(3, '2026-01-27 20:45:00', 'AI-házasság – mikor az algoritmus mondja, hogy „igen”', '3ai.avif- Az emberiség eljutott oda, hogy valaki azt mondta: „Az emberek túl bonyolultak… házasodjunk inkább egy AI-hoz.”\r\nAz AI-partner mindig kedves, mindig figyel, és soha nem sértődik meg.\r\nEgy kapcsolat nem csak kényelmes, hanem néha idegesítő is – és pont ettől igazi.', 2, 1),
(4, '2025-11-14 17:03:00', 'Focista autók… Mikor jönnek?', '4autok.jpg- Ha egy focista megérkezik edzésre, nem azt kérdezed, hogy melyik poszton játszik, hanem hogy melyik autóval.\r\nLamborghini, Ferrari, G-Wagon – mintha a parkoló lenne az igazi bajnokság.\r\nAddig marad a busz, a bicikli és az álmodozás.', 3, 1),
(5, '2026-04-09 12:26:00', 'Olimpiai feszültség: a Sasok edzője csalással vádolva', '5sasok.jpg- Az olimpiai hangulat eleve feszült, de most a Sasok edzőjét csalással vádolják.\r\nA közösség kettészakadt, az internet mémeket gyárt, a bizonyítékok pedig még ködösek.\r\nAz igazság valószínűleg kevésbé drámai, de a reflektorfény most biztosan rajta van.', 1, 1),
(6, '2025-04-22 10:18:00', 'Clash, mennyire is nemes? – szakértő válaszol', '6clash.jpg- A Clash körül mindig ugyanaz a vita: stratégia vagy időrablás? A „szakértő” szerint mindkettő. Elméletben fejleszti az előretervezést, a reakcióidőt és a csapatmunkát. Gyakorlatban viszont inkább azt, hogyan lehet egy „utolsó támadást” még három utolsó támadássá bővíteni.\r\nA nemesség ott kezdődik, amikor nem borulsz ki egy elrontott raid után, és ott ér véget, amikor a telefonod töltőn van, te pedig még mindig klánchatelsz.\r\nA Clash nem rossz, csak veszélyesen hatékony abban, hogy elhitesse: most tényleg fontos dolgod van.', 1, 3),
(7, '2025-08-07 16:41:00', 'Vérdíj az alfa CEO fején', '7alfa.jpg- A modern üzleti világban már nem kardok csapnak össze, hanem LinkedIn-üzenetek. Most pedig új szintre lépett a játék: vérdíj került egy „alfa” CEO fejére.\r\nA cégvezető magabiztos, karizmatikus, és trófeává vált a piacon. Extra fizetés, extra szabadság, extra ego – minden jár.\r\nEgy ponton túl azonban nem te irányítod a céget, hanem a rólad kialakított mítosz.', 3, 3),
(8, '2026-02-15 11:09:00', 'Állásinterjú trükkök', '8allasinterju.jpg- Az állásinterjú nem hazugságverseny, inkább kreatív igazságelrendezés.\r\n„Szeretek csapatban dolgozni” – akkor is, ha legszívesebben egyedül lennél. „Terhelhető vagyok” – amíg van kávé.\r\nA legnagyobb trükk mégis az, hogy mindkét fél úgy tesz, mintha nem tudná: ez egy próbakör.', 3, 3),
(9, '2026-06-03 13:54:00', 'Montgomery teljes CSŐD!', '9montgomer.jpg- A Montgomery neve sokáig egyet jelentett a stabilitással. Aztán ment. Egyenesen a csődbe.\r\nA háttérben túl gyors növekedés, rossz befektetések és az a hit állt, hogy ami eddig működött, az ezután is fog.\r\nA csőd nem robbanás volt, hanem lassú kifulladás. A tanulság egyszerű: nincs túl nagy cég a bukáshoz.', 2, 3),
(10, '2025-02-11 08:40:00', 'Matekóra – szükséges-e?', '10matekora.png- A matekóra az a tantárgy, amit mindenki tanul, de kevesen vallják be, hogy valaha is szerették. A nagy kérdés mégis újra és újra felmerül: tényleg szükség van rá?\r\nnincs.', 2, 4),
(11, '2025-05-29 15:12:00', 'Top 10 szleng', '11t10szelng.png- A szleng olyan, mint a divat: gyorsan változik, és mindig ciki egy kicsit. Íme egy nem hivatalos top 10:\r\n1. Cringe – amikor fáj nézni\r\n2. Based – ritka, de üt\r\n3. NPC – amikor valaki csak létezik\r\n4. Flex – szerénykedve villogás\r\n5. POV – akkor is, ha nem az\r\n6. Bro – bárkire, bármikor\r\n7. Touch grass – finom beszólás\r\n8. Sus – gyanús, de elegánsan\r\n9. Main character – néha túl komolyan\r\n10. Oké, de… – vitaindító klasszikus\r\nHasználni nem kötelező. De érteni? Ajánlott.', 1, 4),
(12, '2025-09-17 18:05:00', 'Legviccesebb mémek – tudományosan megmagyarázva', '12legvmeme.png- A legjobb mémek általában értelmetlenek. Egy kép, egy rossz betűtípus, és egy mondat, ami sehogy sem passzol. És mégis működik.\r\nNevetünk rajtuk, mert felismerjük magunkat bennük. A mém a modern hieroglifa.\r\nVan az a pont, amikor már annyira rossz, hogy jó. Ez nem hiba. Ez a műfaj lényege.', 2, 4),
(13, '2026-01-08 11:33:00', 'Ezért szeresd a macsekokat', '13eszermacs.png- A macskák nem próbálnak lenyűgözni. Nem akarnak megfelelni. Egyszerűen csak vannak – és ettől zseniálisak.\r\nŐk tanítanak meg arra, hogy nem kell mindig produktívnak lenni.\r\nHa egyszer befogadnak, onnantól te alkalmazkodsz.', 3, 4),
(14, '2026-03-21 19:22:00', 'Legjobb gyrosozó – objektív vélemény, teljesen szubjektíven', '14gyros.png- A legjobb gyrosozó mindig az, amelyik nyitva van, amikor éhes vagy.\r\nHa túlcsöpög: pluszpont.\r\nHa a pultos ismer: nagyon jó jel.\r\nA legjobb gyros nem fine dining. Hanem életmentés.', 3, 4),
(15, '2026-01-23 08:34:30', 'BL elfér-e a világunkban?', '15BLelfer.png- Bajnokok Ligája. Hetente többször megáll az élet miatta.\r\nA BL egyszerre sport, show és üzlet. Néha több a körítés, mint a játék.\r\nDe amikor jön egy nagy meccs, mindenki nézi. Mert ez közös élmény.', 1, 4),
(16, '2025-03-05 09:25:00', 'Terhes az iskola macskája?', '16terhescica.png- Az iskola életében kevés dolog tud akkora hullámokat verni, mint egy pletyka. És amikor ez a pletyka az iskola macskájáról szól, ráadásul terhességgel kapcsolatban, akkor garantált a figyelem.\r\nAz elmúlt napokban egyre többen vették észre, hogy a macska „mintha kicsit kerekebb lenne”. A folyosói elemzések beindultak, és mindenki hirtelen állatorvos lett.\r\nA valóság? Egyelőre semmi sincs megerősítve. A macska nem nyilatkozik, viszont láthatóan élvezi a figyelmet.\r\nEgy biztos: ritkán látni ennyire békés témát, ami összehozza az iskolát.', 2, 2),
(17, '2025-05-16 14:10:00', 'Új kabala – mi is ez?', '17ujkabala.png- Megérkezett. Megjelent. Néz ránk. Az új iskolai kabala itt van, és mindenki próbálja feldolgozni.\r\nElső reakciók vegyesek: „cuki”, „ez most komoly?”, de megszokni idő kell.\r\nHogy ikon lesz-e vagy mém, az még kérdés. Addig is: mosolyogjunk rajta, és tegyünk úgy, mintha mindig is itt lett volna.', 1, 2),
(18, '2025-10-02 11:47:00', 'Nyíltnap – amikor minden szép és mindenki kedves', '18nyiltnap.png- Nyíltnapon az iskola egy alternatív univerzumba kerül. A falak tisztábbak, a tanárok mosolygósabbak, a diákok pedig példamutatóak.\r\nA leendő diákok nagy szemekkel néznek körbe, a jelenlegiek pedig próbálják eldönteni, mit mondjanak: az igazat vagy a marketing verziót.\r\nRitka pillanat, de fontos: ilyenkor mindenki kicsit büszke arra, hogy ide tartozik.', 1, 2),
(19, '2026-01-19 07:58:00', 'Rendkívüli hóhelyzet', '19rendho.png- Hó esett. Nem kicsit. Azonnal elindult a kérdés: lesz-e suli?\r\nA közösségi csoportok felrobbantak, mindenki frissítette az értesítéseket.\r\nA helyzet végül „rendkívüli” lett, de nem feltétlenül úgy, ahogy mindenki remélte. Viszont volt miről beszélni.', 3, 2),
(20, '2026-04-27 16:36:00', 'LOL (League of Legends) bajnokság – GG vagy EZ?', '20lol.png- Iskolai LOL-bajnokság. Három szó, ami azonnal két táborra osztja a közösséget.\r\nA meccsek során volt clutch, rage ping és legendás visszatérés.\r\nA legjobb mégsem a győzelem volt, hanem az, hogy egy csomó ember egyszerre lelkesedett. A bajnokság bebizonyította: az e-sport közösséget épít.', 2, 2),
(21, '2025-04-01 17:20:00', 'Székesfehérvár szórakozóhelyei', '21szfvar.png- Székesfehérvár nem Budapest, de nem is egy unalmas vasárnap délután. A szórakozóhelyek kínálata olyan, mint egy vegyes tál: van benne minden, csak tudni kell, mikor hova érdemes menni.\r\nVannak helyek, ahol a zene hangosabb, mint a gondolataid, és olyanok is, ahol inkább beszélgetni lehet.\r\nA közönség vegyes, a hangulat általában jó. Ha tudod, mit keresel, megtalálod. Ha nem, akkor is lesz belőle egy történet.', 2, 5),
(22, '2025-07-12 14:48:00', 'Mit lehet itt csinálni? – kérdezik a fiatalok', '22mitlehet.png- Ez a kérdés szinte kötelezően elhangzik: „jó, de mit lehet itt csinálni?”.\r\nVan mozi, kávézók, parkok, edzőtermek és események – csak nem mindig akkor, amikor ráérnél.\r\nA város nem adja tálcán a szórakozást, inkább azt mondja: oldjátok meg. És ez néha működik.', 1, 5),
(23, '2026-02-03 18:06:00', 'Ők lesznek az élőszereplős Aranyhaj főszereplői… vagy mégsem?', '23arany.png- Az élőszereplős Aranyhaj castingja még nem végleges, de az internet már döntött.\r\nA rajongók szerint a karizma, az energia és a drámai hajlengés a legfontosabb.\r\nA viták hevesek, de amikor kijön a film, mindenki megnézi. A haj pedig biztosan főszereplő lesz.', 1, 5),
(24, '2026-05-22 20:31:00', 'Új Geometry Dash szintek – ujjak felkészülni', '24geometri.png- Megjelentek az új Geometry Dash szintek, és ezzel együtt a kollektív idegösszeomlás is.\r\nGyorsabbak, nehezebbek, villogóbbak. Az első próbálkozás reményteljes, a tizediknél már személyes ügy.\r\nDe amikor végre sikerül… azért játszunk újra. GG.', 2, 5),
(25, '2026-01-23 11:02:27', 'Miert piros a hold', '6clash.jpg- meow meow meow meow meow', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Világ'),
(2, 'Széchenyi'),
(3, 'Gazdaság'),
(4, 'Vélemény'),
(5, 'Szórakozás');

-- --------------------------------------------------------

--
-- Table structure for table `writers`
--

CREATE TABLE `writers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(100) NOT NULL,
  `dob` datetime NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `writers`
--

INSERT INTO `writers` (`id`, `name`, `position`, `dob`, `password`) VALUES
(1, 'Hanna', 'CFO', '2006-01-14 00:00:00', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918'),
(2, 'Lara', 'COO', '2005-11-19 00:00:00', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918'),
(3, 'Levente', 'CEO', '2005-11-19 00:00:00', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_articles_writer` (`writer_id`),
  ADD KEY `fk_articles_category` (`category_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `writers`
--
ALTER TABLE `writers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `writers`
--
ALTER TABLE `writers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `fk_articles_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_articles_writer` FOREIGN KEY (`writer_id`) REFERENCES `writers` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
