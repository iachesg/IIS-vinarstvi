-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Počítač: sql100.byetcluster.com
-- Vytvořeno: Stř 19. lis 2025, 16:40
-- Verze serveru: 10.6.22-MariaDB
-- Verze PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `if0_40459314_vinarstvi_db`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `Hnojivo`
--


CREATE TABLE `Hnojivo` (
  `id_osetreni` int(11) NOT NULL,
  `hnojivo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `Objednavka`
--

CREATE TABLE `Objednavka` (
  `id_objednavka` int(11) NOT NULL,
  `id_zakaznik` int(11) NOT NULL,
  `datum` datetime DEFAULT current_timestamp(),
  `stav` varchar(50) NOT NULL,
  `celkova_cena` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `Objednavka_polozka`
--

CREATE TABLE `Objednavka_polozka` (
  `id_polozka` int(11) NOT NULL,
  `id_objednavka` int(11) NOT NULL,
  `id_vina` int(11) NOT NULL,
  `mnozstvi` int(11) NOT NULL,
  `cena_za_kus` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `Osetreni`
--

CREATE TABLE `Osetreni` (
  `id_osetreni` int(11) NOT NULL,
  `id_radku` int(11) NOT NULL,
  `id_pracovnika` int(11) DEFAULT NULL,
  `datum` date NOT NULL,
  `poznamka` text DEFAULT NULL,
  `replikace` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `Postrik`
--

CREATE TABLE `Postrik` (
  `id_osetreni` int(11) NOT NULL,
  `postrik` varchar(100) NOT NULL,
  `koncentrace` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `Rez`
--

CREATE TABLE `Rez` (
  `id_osetreni` int(11) NOT NULL,
  `technika` varchar(100) DEFAULT NULL,
  `nastroj` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `Role`
--

CREATE TABLE `Role` (
  `id_role` int(11) NOT NULL,
  `nazev` varchar(50) NOT NULL,
  `popis` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `Role`
--

INSERT INTO `Role` (`id_role`, `nazev`, `popis`) VALUES
(1, 'Administrator', 'Spravuje uživatele a systém.'),
(2, 'Vinar', 'Spravuje vinice, plánuje a schvaluje úkony.'),
(3, 'Pracovnik', 'Zaznamenává provedené úkony a sklizeň.'),
(4, 'Zakaznik', 'Registrovaný zákazník pro nákupy.'),
(5, 'Host', 'Neregistrovaný uživatel s omezeným přístupem.');

-- --------------------------------------------------------

--
-- Struktura tabulky `Sklizen`
--

CREATE TABLE `Sklizen` (
  `id_sklizne` int(11) NOT NULL,
  `id_radku` int(11) NOT NULL,
  `id_pracovnika` int(11) DEFAULT NULL,
  `datum` date NOT NULL,
  `odruda` varchar(100) DEFAULT NULL,
  `hmotnost_sklizenych_hroznu` decimal(10,2) NOT NULL,
  `cukernatost` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `Uzivatel`
--

CREATE TABLE `Uzivatel` (
  `id_uzivatele` int(11) NOT NULL,
  `jmeno` varchar(100) NOT NULL,
  `prijmeni` varchar(100) NOT NULL,
  `e_mail` varchar(100) NOT NULL,
  `heslo` varchar(255) NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `Uzivatel`
--

INSERT INTO `Uzivatel` (`id_uzivatele`, `jmeno`, `prijmeni`, `e_mail`, `heslo`, `id_role`) VALUES
(1, '2', '2', '4', '5', 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `Vino`
--

CREATE TABLE `Vino` (
  `id_vina` int(11) NOT NULL,
  `id_sklizne` int(11) DEFAULT NULL,
  `rocnik` int(11) NOT NULL,
  `odruda` varchar(100) NOT NULL,
  `datum_lahvovani` date DEFAULT NULL,
  `procenta_alkoholu` decimal(4,2) DEFAULT NULL,
  `pocet_lahvi` int(11) NOT NULL,
  `v_prodeji` tinyint(1) DEFAULT 0,
  `cena_za_lahev` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `Vinohradsky_radek`
--

CREATE TABLE `Vinohradsky_radek` (
  `id_radku` int(11) NOT NULL,
  `odruda` varchar(100) NOT NULL,
  `pocet_hlav` int(11) DEFAULT NULL,
  `rok_vysadby` int(11) DEFAULT NULL,
  `barva_hroznu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `Zavlazovani`
--

CREATE TABLE `Zavlazovani` (
  `id_osetreni` int(11) NOT NULL,
  `mnozstvi_vody` decimal(10,2) DEFAULT NULL,
  `efektivnost` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `Hnojivo`
--
ALTER TABLE `Hnojivo`
  ADD PRIMARY KEY (`id_osetreni`);

--
-- Klíče pro tabulku `Objednavka`
--
ALTER TABLE `Objednavka`
  ADD PRIMARY KEY (`id_objednavka`),
  ADD KEY `id_zakaznik` (`id_zakaznik`);

--
-- Klíče pro tabulku `Objednavka_polozka`
--
ALTER TABLE `Objednavka_polozka`
  ADD PRIMARY KEY (`id_polozka`),
  ADD KEY `id_objednavka` (`id_objednavka`),
  ADD KEY `id_vina` (`id_vina`);

--
-- Klíče pro tabulku `Osetreni`
--
ALTER TABLE `Osetreni`
  ADD PRIMARY KEY (`id_osetreni`),
  ADD KEY `id_radku` (`id_radku`),
  ADD KEY `id_pracovnika` (`id_pracovnika`);

--
-- Klíče pro tabulku `Postrik`
--
ALTER TABLE `Postrik`
  ADD PRIMARY KEY (`id_osetreni`);

--
-- Klíče pro tabulku `Rez`
--
ALTER TABLE `Rez`
  ADD PRIMARY KEY (`id_osetreni`);

--
-- Klíče pro tabulku `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`id_role`),
  ADD UNIQUE KEY `nazev` (`nazev`);

--
-- Klíče pro tabulku `Sklizen`
--
ALTER TABLE `Sklizen`
  ADD PRIMARY KEY (`id_sklizne`),
  ADD KEY `id_radku` (`id_radku`),
  ADD KEY `id_pracovnika` (`id_pracovnika`);

--
-- Klíče pro tabulku `Uzivatel`
--
ALTER TABLE `Uzivatel`
  ADD PRIMARY KEY (`id_uzivatele`),
  ADD UNIQUE KEY `e_mail` (`e_mail`),
  ADD KEY `id_role` (`id_role`);

--
-- Klíče pro tabulku `Vino`
--
ALTER TABLE `Vino`
  ADD PRIMARY KEY (`id_vina`),
  ADD KEY `id_sklizne` (`id_sklizne`);

--
-- Klíče pro tabulku `Vinohradsky_radek`
--
ALTER TABLE `Vinohradsky_radek`
  ADD PRIMARY KEY (`id_radku`);

--
-- Klíče pro tabulku `Zavlazovani`
--
ALTER TABLE `Zavlazovani`
  ADD PRIMARY KEY (`id_osetreni`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `Objednavka`
--
ALTER TABLE `Objednavka`
  MODIFY `id_objednavka` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `Objednavka_polozka`
--
ALTER TABLE `Objednavka_polozka`
  MODIFY `id_polozka` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `Osetreni`
--
ALTER TABLE `Osetreni`
  MODIFY `id_osetreni` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `Sklizen`
--
ALTER TABLE `Sklizen`
  MODIFY `id_sklizne` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `Uzivatel`
--
ALTER TABLE `Uzivatel`
  MODIFY `id_uzivatele` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `Vino`
--
ALTER TABLE `Vino`
  MODIFY `id_vina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `Vinohradsky_radek`
--
ALTER TABLE `Vinohradsky_radek`
  MODIFY `id_radku` int(11) NOT NULL AUTO_INCREMENT;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `Hnojivo`
--
ALTER TABLE `Hnojivo`
  ADD CONSTRAINT `Hnojivo_ibfk_1` FOREIGN KEY (`id_osetreni`) REFERENCES `Osetreni` (`id_osetreni`);

--
-- Omezení pro tabulku `Objednavka`
--
ALTER TABLE `Objednavka`
  ADD CONSTRAINT `Objednavka_ibfk_1` FOREIGN KEY (`id_zakaznik`) REFERENCES `Uzivatel` (`id_uzivatele`);

--
-- Omezení pro tabulku `Objednavka_polozka`
--
ALTER TABLE `Objednavka_polozka`
  ADD CONSTRAINT `Objednavka_polozka_ibfk_1` FOREIGN KEY (`id_objednavka`) REFERENCES `Objednavka` (`id_objednavka`),
  ADD CONSTRAINT `Objednavka_polozka_ibfk_2` FOREIGN KEY (`id_vina`) REFERENCES `Vino` (`id_vina`);

--
-- Omezení pro tabulku `Osetreni`
--
ALTER TABLE `Osetreni`
  ADD CONSTRAINT `Osetreni_ibfk_1` FOREIGN KEY (`id_radku`) REFERENCES `Vinohradsky_radek` (`id_radku`),
  ADD CONSTRAINT `Osetreni_ibfk_2` FOREIGN KEY (`id_pracovnika`) REFERENCES `Uzivatel` (`id_uzivatele`);

--
-- Omezení pro tabulku `Postrik`
--
ALTER TABLE `Postrik`
  ADD CONSTRAINT `Postrik_ibfk_1` FOREIGN KEY (`id_osetreni`) REFERENCES `Osetreni` (`id_osetreni`);

--
-- Omezení pro tabulku `Rez`
--
ALTER TABLE `Rez`
  ADD CONSTRAINT `Rez_ibfk_1` FOREIGN KEY (`id_osetreni`) REFERENCES `Osetreni` (`id_osetreni`);

--
-- Omezení pro tabulku `Sklizen`
--
ALTER TABLE `Sklizen`
  ADD CONSTRAINT `Sklizen_ibfk_1` FOREIGN KEY (`id_radku`) REFERENCES `Vinohradsky_radek` (`id_radku`),
  ADD CONSTRAINT `Sklizen_ibfk_2` FOREIGN KEY (`id_pracovnika`) REFERENCES `Uzivatel` (`id_uzivatele`);

--
-- Omezení pro tabulku `Uzivatel`
--
ALTER TABLE `Uzivatel`
  ADD CONSTRAINT `Uzivatel_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `Role` (`id_role`);

--
-- Omezení pro tabulku `Vino`
--
ALTER TABLE `Vino`
  ADD CONSTRAINT `Vino_ibfk_1` FOREIGN KEY (`id_sklizne`) REFERENCES `Sklizen` (`id_sklizne`);

--
-- Omezení pro tabulku `Zavlazovani`
--
ALTER TABLE `Zavlazovani`
  ADD CONSTRAINT `Zavlazovani_ibfk_1` FOREIGN KEY (`id_osetreni`) REFERENCES `Osetreni` (`id_osetreni`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
