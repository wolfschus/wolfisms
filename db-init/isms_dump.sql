-- phpMyAdmin SQL Dump
-- version 5.2.3deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 28. Jul 2026 um 09:32
-- Server-Version: 11.8.6-MariaDB-5ubuntu0.1 from Ubuntu
-- PHP-Version: 8.5.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `isms_dump`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Abteilungen`
--

CREATE TABLE `Abteilungen` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `leitung_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Daten für Tabelle `Abteilungen`
--

INSERT INTO `Abteilungen` (`id`, `name`, `leitung_id`, `parent_id`) VALUES
(1, 'Abteilung', NULL, NULL),
(2, 'Admin', NULL, NULL),
(3, 'DEV', NULL, NULL),
(7, 'Geschäftsleitung', NULL, NULL),
(8, 'IT', NULL, NULL),
(9, 'Vertrieb', NULL, NULL),
(10, 'Verwaltung', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `activities`
--

CREATE TABLE `activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `datumuhrzeit` datetime NOT NULL DEFAULT current_timestamp(),
  `user` int(10) UNSIGNED DEFAULT NULL,
  `nummer` varchar(255) NOT NULL,
  `bereich` varchar(255) DEFAULT NULL,
  `was` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(10) UNSIGNED NOT NULL,
  `key_hash` varchar(64) NOT NULL,
  `beschreibung` varchar(255) DEFAULT NULL,
  `aktiv` tinyint(1) NOT NULL DEFAULT 1,
  `erstellt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Assets`
--

CREATE TABLE `Assets` (
  `id` int(11) UNSIGNED NOT NULL,
  `Nummer` varchar(16) DEFAULT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `Beschreibung` text DEFAULT NULL,
  `Besitzer` int(11) UNSIGNED DEFAULT NULL,
  `Abteilung` varchar(64) DEFAULT NULL,
  `Typ` varchar(64) DEFAULT NULL,
  `Kategorie` varchar(64) DEFAULT NULL,
  `Status` varchar(64) DEFAULT NULL,
  `Kritik` varchar(64) DEFAULT NULL,
  `Person` tinyint(1) DEFAULT 0,
  `Klassifizierung` varchar(64) DEFAULT NULL,
  `Ersteller` int(11) UNSIGNED DEFAULT 0,
  `Erstelldatum` date NOT NULL DEFAULT current_timestamp(),
  `Änderer` int(11) UNSIGNED DEFAULT 0,
  `Änderdatum` date DEFAULT current_timestamp(),
  `Datum` date DEFAULT current_timestamp(),
  `Reviewer` int(10) UNSIGNED DEFAULT 0,
  `review` date NOT NULL DEFAULT current_timestamp(),
  `archiviert` tinyint(1) NOT NULL DEFAULT 0,
  `Vertraulichkeit` varchar(255) DEFAULT NULL,
  `Integrität` varchar(255) DEFAULT NULL,
  `Verfügbarkeit` varchar(255) DEFAULT NULL,
  `tochter` varchar(255) DEFAULT NULL,
  `asset_typ` varchar(100) DEFAULT NULL,
  `betroffene_personen` varchar(500) DEFAULT NULL,
  `art_pbd` varchar(500) DEFAULT NULL,
  `datenhaltung` varchar(100) DEFAULT NULL,
  `besondere_pbd` tinyint(1) DEFAULT 0,
  `Wert` varchar(255) DEFAULT NULL,
  `Authentizität` varchar(255) DEFAULT NULL,
  `Name_en` text DEFAULT NULL,
  `Beschreibung_en` text DEFAULT NULL,
  `abteilung_id` int(11) DEFAULT NULL,
  `normen` varchar(256) DEFAULT NULL COMMENT 'Kommagetrennte IDs verknüpfter Normen (aus Tabelle Normen)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `asset_art_pbd`
--

CREATE TABLE `asset_art_pbd` (
  `id` int(11) NOT NULL,
  `art` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `asset_art_pbd`
--

INSERT INTO `asset_art_pbd` (`id`, `art`) VALUES
(4, 'Abrechnungsdaten'),
(2, 'Kontaktdaten'),
(1, 'Stammdaten'),
(3, 'Vertragsdaten');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `asset_betroffene_personen`
--

CREATE TABLE `asset_betroffene_personen` (
  `id` int(11) NOT NULL,
  `bezeichnung` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `asset_betroffene_personen`
--

INSERT INTO `asset_betroffene_personen` (`id`, `bezeichnung`) VALUES
(4, 'Bewerber'),
(5, 'externe Partner'),
(2, 'Kunden'),
(3, 'Lieferanten'),
(1, 'Mitarbeitende');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `asset_datenhaltung`
--

CREATE TABLE `asset_datenhaltung` (
  `id` int(11) NOT NULL,
  `datenhaltung` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `asset_datenhaltung`
--

INSERT INTO `asset_datenhaltung` (`id`, `datenhaltung`) VALUES
(2, 'Cloud EU'),
(3, 'Cloud Nicht-EU'),
(4, 'Hybrid'),
(1, 'On-Prem');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `asset_kategorie`
--

CREATE TABLE `asset_kategorie` (
  `id` int(10) UNSIGNED NOT NULL,
  `Kategorie` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `asset_kategorie`
--

INSERT INTO `asset_kategorie` (`id`, `Kategorie`) VALUES
(1, 'Daten - Informationswerte'),
(16, 'O – Ownership (Eigentümerschaft)'),
(17, 'B – Business Process (Geschäftsprozess)'),
(18, 'A – Application (Anwendung)'),
(19, 'S – System'),
(20, 'H – Hardware'),
(21, 'I – Infrastructure (Infrastruktur)');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `asset_status`
--

CREATE TABLE `asset_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `asset_status`
--

INSERT INTO `asset_status` (`id`, `status`) VALUES
(1, 'aktiv'),
(2, 'inaktiv'),
(3, 'in Beschaffung'),
(4, 'in Entsorgung'),
(5, 'entsorgt');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `asset_typ`
--

CREATE TABLE `asset_typ` (
  `id` int(11) NOT NULL,
  `typ` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `asset_typ`
--

INSERT INTO `asset_typ` (`id`, `typ`) VALUES
(1, 'Anwendung'),
(2, 'Datenbank'),
(4, 'Plattform'),
(3, 'Service');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Audit`
--

CREATE TABLE `Audit` (
  `id` int(10) UNSIGNED NOT NULL,
  `Kapitel` varchar(255) DEFAULT NULL,
  `Frage` varchar(255) DEFAULT NULL,
  `pflicht` tinyint(1) NOT NULL,
  `gewichtung` int(11) NOT NULL,
  `status` varchar(64) NOT NULL,
  `datum` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `Audit`
--

INSERT INTO `Audit` (`id`, `Kapitel`, `Frage`, `pflicht`, `gewichtung`, `status`, `datum`) VALUES
(1, 'ISMS-Grundlagen und Governance', 'Geltungsbereich (Scope) klar definiert, abgegrenzt und dokumentiert', 1, 1, 'erfüllt', '2026-01-24'),
(2, 'ISMS-Grundlagen und Governance', 'Kontext der Organisation (interne und externe Themen) dokumentiert', 1, 1, 'erfüllt', '2026-01-24'),
(3, 'ISMS-Grundlagen und Governance', 'Interessierte Parteien inkl. Anforderungen identifiziert', 1, 1, 'erfüllt', '2026-01-24'),
(4, 'ISMS-Grundlagen und Governance', 'ISMS-Ziele definiert, messbar und überwacht', 1, 1, 'teilw.', '2026-01-24'),
(5, 'ISMS-Grundlagen und Governance', 'ISMS-Dokumentationsstruktur nachvollziehbar', 1, 1, 'teilw.', '2026-01-24'),
(6, 'ISMS-Grundlagen und Governance', 'Rollen und Verantwortlichkeiten (ISMS-Beauftragter etc.) festgelegt', 1, 1, 'offen', '2026-01-24'),
(7, 'ISMS-Grundlagen und Governance', 'Management-Commitment dokumentiert (Policy, Reviews)', 1, 1, 'offen', '2026-01-24'),
(8, 'Informationssicherheitsleitlinie (Policy)', 'Genehmigte Informationssicherheitsleitlinie vorhanden', 1, 1, 'erfüllt', '2026-01-24'),
(9, 'Informationssicherheitsleitlinie (Policy)', 'Versioniert, freigegeben und kommuniziert', 1, 1, 'erfüllt', '2026-01-24'),
(10, 'Informationssicherheitsleitlinie (Policy)', 'Für Mitarbeiter zugänglich', 1, 1, 'erfüllt', '2026-01-24'),
(11, 'Informationssicherheitsleitlinie (Policy)', 'Inhalte konsistent zu Zielen, Risiken und Maßnahmen', 1, 1, 'erfüllt', '2026-01-24'),
(12, 'Informationssicherheitsleitlinie (Policy)', 'Regelmäßige Überprüfung nachweisbar', 1, 1, 'erfüllt', '2026-01-24'),
(13, 'Asset-Management', 'Vollständiges Asset-Verzeichnis (IT, OT, Informationen, Services)', 1, 1, 'teilw.', '2026-01-24'),
(14, 'Asset-Management', 'Asset-Eigentümer festgelegt', 1, 1, 'teilw.', '2026-01-24'),
(15, 'Asset-Management', 'Klassifizierung (z. B. Schutzbedarf / CIA) dokumentiert', 1, 1, 'teilw.', '2026-01-24'),
(16, 'Asset-Management', 'Kritische Abhängigkeiten erfasst', 1, 1, 'teilw.', '2026-01-24'),
(17, 'Risikomanagement', 'Risikomanagement-Methode dokumentiert', 1, 1, 'erfüllt', '2026-01-24'),
(18, 'Risikomanagement', 'Schutzbedarf / CIA-Bewertung nachvollziehbar', 1, 1, 'erfüllt', '2026-01-24'),
(19, 'Risikomanagement', 'Risiken identifiziert (vollständig & realistisch)', 1, 1, 'teilw.', '2026-01-24'),
(20, 'Risikomanagement', 'Risikobewertung konsistent angewendet', 1, 1, 'erfüllt', '2026-01-24'),
(21, 'Risikomanagement', 'Risikobehandlungsplan vorhanden', 1, 1, 'teilw.', '2026-01-24'),
(22, 'Risikomanagement', 'Restrisiken akzeptiert (Management-Freigabe)', 1, 1, 'nicht erfüllt', '2026-01-24'),
(23, 'Risikomanagement', 'Regelmäßige Neubewertung nachweisbar', 1, 1, 'erfüllt', '2026-01-24'),
(24, 'Statement of Applicability (SoA)', 'Alle Annex-A-Controls berücksichtigt', 1, 1, 'erfüllt', '2026-01-24'),
(25, 'Statement of Applicability (SoA)', 'Umsetzung je Control beschrieben', 1, 1, 'teilw.', '2026-01-24'),
(26, 'Statement of Applicability (SoA)', 'Verknüpfung zu Maßnahmen / Dokumenten vorhanden', 1, 1, 'nicht erfüllt', '2026-01-24'),
(27, 'Statement of Applicability (SoA)', 'Version & Freigabe dokumentiert', 1, 1, 'erfüllt', '2026-01-24'),
(28, 'Richtlinien und Konzepte (Policies)', 'Zugriffs- und Berechtigungskonzept', 1, 1, 'erfüllt', '2026-01-24'),
(29, 'Richtlinien und Konzepte (Policies)', 'Passwort- / Authentifizierungskonzept', 1, 1, 'erfüllt', '2026-01-24'),
(30, 'Richtlinien und Konzepte (Policies)', 'Backup- und Wiederherstellungskonzept', 1, 1, 'erfüllt', '2026-01-24'),
(31, 'Richtlinien und Konzepte (Policies)', 'Logging- und Monitoring-Konzept', 1, 1, 'teilw.', '2026-01-24'),
(32, 'Richtlinien und Konzepte (Policies)', 'Incident-Management-Richtlinie', 1, 1, 'teilw.', '2026-01-24'),
(33, 'Richtlinien und Konzepte (Policies)', 'Lieferanten- / Dienstleisterrichtlinie', 1, 1, 'erfüllt', '2026-01-24'),
(34, 'Richtlinien und Konzepte (Policies)', 'Schulungs- und Awareness-Konzept', 1, 1, 'erfüllt', '2026-01-24'),
(35, 'Richtlinien und Konzepte (Policies)', 'Alle Richtlinien: versioniert, freigegeben, aktuell, bekanntgemacht', 1, 5, 'erfüllt', '2026-01-24'),
(36, 'Operative Umsetzung (Wirksamkeit!)', 'Benutzer- und Rollenverwaltung technisch umgesetzt', 1, 1, 'erfüllt', '2026-01-24'),
(37, 'Operative Umsetzung (Wirksamkeit!)', 'Least-Privilege nachweisbar', 1, 1, 'teilw.', '2026-01-24'),
(38, 'Operative Umsetzung (Wirksamkeit!)', 'Logging aktiv und ausgewertet', 1, 1, 'erfüllt', '2026-01-24'),
(39, 'Operative Umsetzung (Wirksamkeit!)', 'Backups getestet (Restore-Nachweise!)', 1, 1, 'erfüllt', '2026-01-24'),
(40, 'Operative Umsetzung (Wirksamkeit!)', 'Patch- und Update-Prozess dokumentiert', 1, 1, 'erfüllt', '2026-01-24'),
(41, 'Operative Umsetzung (Wirksamkeit!)', 'Schutzmaßnahmen nicht nur beschrieben, sondern aktiv', 1, 1, 'erfüllt', '2026-01-24'),
(42, 'Incident- und Ereignismanagement', 'Definition von Sicherheitsvorfällen', 1, 1, 'teilw.', '2026-01-24'),
(43, 'Incident- und Ereignismanagement', 'Meldewege und Eskalation geregelt', 1, 1, 'teilw.', '2026-01-24'),
(44, 'Incident- und Ereignismanagement', 'Incident-Register vorhanden', 1, 1, 'erfüllt', '2026-01-24'),
(45, 'Incident- und Ereignismanagement', 'Bearbeitung und Lessons Learned dokumentiert', 1, 1, 'teilw.', '2026-01-24'),
(46, 'Incident- und Ereignismanagement', 'Testfälle oder reale Incidents vorhanden', 1, 1, 'erfüllt', '2026-01-24'),
(47, 'Incident- und Ereignismanagement', 'Verbindung zu Risiken und Maßnahmen', 1, 1, 'erfüllt', '2026-01-24'),
(48, 'Lieferanten- und Dienstleistermanagement', 'Relevante Lieferanten identifiziert', 1, 1, 'erfüllt', '2026-01-24'),
(49, 'Lieferanten- und Dienstleistermanagement', 'Sicherheitsanforderungen definiert', 1, 1, 'erfüllt', '2026-01-24'),
(50, 'Lieferanten- und Dienstleistermanagement', 'Risiko-Bewertung je Lieferant', 1, 1, 'erfüllt', '2026-01-24'),
(51, 'Lieferanten- und Dienstleistermanagement', 'Verträge / AVV / SLAs vorhanden', 1, 1, 'erfüllt', '2026-01-24'),
(52, 'Lieferanten- und Dienstleistermanagement', 'Regelmäßige Überprüfung dokumentiert', 1, 1, 'erfüllt', '2026-01-24'),
(53, 'Schulung und Awareness', 'Schulungskonzept dokumentiert', 1, 1, 'teilw.', '2026-01-24'),
(54, 'Schulung und Awareness', 'Pflichtschulungen definiert', 1, 1, 'erfüllt', '2026-01-24'),
(55, 'Schulung und Awareness', 'Teilnahme nachweisbar', 1, 1, 'erfüllt', '2026-01-24'),
(56, 'Schulung und Awareness', 'Neue Mitarbeiter geschult', 1, 1, 'erfüllt', '2026-01-24'),
(57, 'Schulung und Awareness', 'Regelmäßige Wiederholungen', 1, 1, 'erfüllt', '2026-01-24'),
(58, 'Schulung und Awareness', 'Awareness-Maßnahmen dokumentiert', 1, 1, 'erfüllt', '2026-01-24'),
(59, 'Überwachung, Messung und KPIs', 'ISMS-Kennzahlen definiert', 1, 1, 'nicht erfüllt', '2026-01-24'),
(60, 'Überwachung, Messung und KPIs', 'Messungen regelmäßig durchgeführt', 1, 1, 'teilw.', '2026-01-24'),
(61, 'Überwachung, Messung und KPIs', 'Abweichungen dokumentiert', 1, 1, 'nicht erfüllt', '2026-01-24'),
(62, 'Überwachung, Messung und KPIs', 'Maßnahmen abgeleitet', 1, 1, 'teilw.', '2026-01-24'),
(63, 'Überwachung, Messung und KPIs', 'Trends erkennbar', 1, 1, 'nicht erfüllt', '2026-01-24'),
(64, 'Interne Audits', 'Audit-Programm vorhanden', 1, 1, 'erfüllt', '2026-01-24'),
(65, 'Interne Audits', 'Auditor unabhängig', 1, 1, 'erfüllt', '2026-01-24'),
(66, 'Interne Audits', 'Auditberichte dokumentiert', 1, 1, 'erfüllt', '2026-01-24'),
(67, 'Interne Audits', 'Abweichungen klassifiziert', 1, 1, 'erfüllt', '2026-01-24'),
(68, 'Interne Audits', 'Korrekturmaßnahmen umgesetzt', 1, 1, 'erfüllt', '2026-01-24'),
(69, 'Interne Audits', 'Wirksamkeitsprüfung erfolgt', 1, 1, 'erfüllt', '2026-01-24'),
(70, 'Management-Review', 'Regelmäßig durchgeführt', 1, 1, 'nicht erfüllt', '2026-01-24'),
(71, 'Management-Review', 'Alle Pflichtinputs enthalten', 1, 1, 'nicht erfüllt', '2026-01-24'),
(72, 'Management-Review', 'Entscheidungen & Maßnahmen dokumentiert', 1, 1, 'nicht erfüllt', '2026-01-24'),
(73, 'Management-Review', 'Ressourcenfreigaben erkennbar', 1, 1, 'nicht erfüllt', '2026-01-24'),
(74, 'Management-Review', 'Follow-up nachweisbar', 1, 1, 'nicht erfüllt', '2026-01-24'),
(75, 'Korrektur- und Verbesserungsmaßnahmen', 'Abweichungen dokumentiert', 1, 1, 'teilw.', '2026-01-24'),
(76, 'Korrektur- und Verbesserungsmaßnahmen', 'Ursachenanalyse durchgeführt', 1, 1, 'erfüllt', '2026-01-24'),
(77, 'Korrektur- und Verbesserungsmaßnahmen', 'Maßnahmen definiert', 1, 1, 'erfüllt', '2026-01-24'),
(78, 'Korrektur- und Verbesserungsmaßnahmen', 'Verantwortliche benannt', 1, 1, 'erfüllt', '2026-01-24'),
(79, 'Korrektur- und Verbesserungsmaßnahmen', 'Fristen gesetzt', 1, 1, 'erfüllt', '2026-01-24'),
(80, 'Korrektur- und Verbesserungsmaßnahmen', 'Wirksamkeit geprüft', 0, 1, 'erfüllt', '2026-01-24'),
(81, 'Dokumenten- und Nachweismanagement', 'Dokumentenlenkung geregelt', 1, 1, 'erfüllt', '2026-01-24'),
(82, 'Dokumenten- und Nachweismanagement', 'Versionierung konsistent', 1, 1, 'erfüllt', '2026-01-24'),
(83, 'Dokumenten- und Nachweismanagement', 'Freigaben nachvollziehbar', 1, 1, 'erfüllt', '2026-01-24'),
(84, 'Dokumenten- und Nachweismanagement', 'Veraltete Dokumente gesperrt', 1, 1, 'erfüllt', '2026-01-24'),
(85, 'Dokumenten- und Nachweismanagement', 'Nachweise schnell auffindbar', 1, 1, 'erfüllt', '2026-01-24');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AuditCE`
--

CREATE TABLE `AuditCE` (
  `id` int(11) NOT NULL,
  `Kapitel` varchar(255) NOT NULL,
  `Frage` text NOT NULL,
  `pflicht` tinyint(1) DEFAULT 0,
  `gewichtung` int(11) DEFAULT 1,
  `status` varchar(50) DEFAULT 'offen',
  `datum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `AuditCE`
--

INSERT INTO `AuditCE` (`id`, `Kapitel`, `Frage`, `pflicht`, `gewichtung`, `status`, `datum`) VALUES
(1, 'Firewalls', 'Eine Firewall oder ein vergleichbares Netzwerk-Boundary-Device ist an allen Internet-Zugangspunkten vorhanden.', 1, 5, 'erfüllt', '2026-05-09'),
(2, 'Firewalls', 'Die Standard-Passwörter aller Firewalls wurden geändert.', 1, 5, 'erfüllt', '2026-05-09'),
(3, 'Firewalls', 'Ungenutzte und nicht benötigte Dienste und Ports sind gesperrt.', 1, 4, 'erfüllt', '2026-05-09'),
(4, 'Firewalls', 'Eingehender Datenverkehr wird auf bekannte, notwendige Quellen beschränkt.', 1, 4, 'erfüllt', '2026-05-09'),
(5, 'Firewalls', 'Die Firewall-Regeln werden regelmäßig überprüft und dokumentiert.', 0, 3, 'teilw.', '2026-05-09'),
(6, 'Sichere Konfiguration', 'Standard-Passwörter und -Konten werden auf allen Geräten und Diensten geändert oder deaktiviert.', 1, 5, 'erfüllt', '2026-05-09'),
(7, 'Sichere Konfiguration', 'Nicht benötigte Software, Konten und Dienste werden entfernt oder deaktiviert.', 1, 4, 'erfüllt', '2026-05-09'),
(8, 'Sichere Konfiguration', 'Auto-Run-Funktionen für Wechseldatenträger sind deaktiviert.', 0, 3, 'erfüllt', '2026-05-09'),
(9, 'Sichere Konfiguration', 'Systemeinstellungen werden dokumentiert und regelmäßig überprüft.', 0, 3, 'teilw.', '2026-05-09'),
(10, 'Zugriffskontrolle', 'Benutzerkonten werden nur für autorisierte Personen angelegt und bei Ausscheiden sofort deaktiviert.', 1, 5, 'erfüllt', '2026-05-09'),
(11, 'Zugriffskontrolle', 'Administrative Rechte sind auf das notwendige Minimum beschränkt (Least Privilege).', 1, 5, 'erfüllt', '2026-05-09'),
(12, 'Zugriffskontrolle', 'Administrative Aufgaben werden nicht über Standard-Benutzerkonten durchgeführt.', 1, 4, 'erfüllt', '2026-05-09'),
(13, 'Zugriffskontrolle', 'Multi-Faktor-Authentifizierung (MFA) ist für privilegierte Konten aktiviert.', 1, 5, 'erfüllt', '2026-05-09'),
(14, 'Zugriffskontrolle', 'Passwortrichtlinien erzwingen sichere Passwörter (Länge, Komplexität oder Passphrasen).', 1, 4, 'erfüllt', '2026-05-09'),
(15, 'Schutz vor Schadsoftware', 'Auf allen Endgeräten ist eine aktuelle Malware-Schutz-Lösung installiert und aktiv.', 1, 5, 'erfüllt', '2026-05-09'),
(16, 'Schutz vor Schadsoftware', 'Malware-Signaturen / Schutzdefinitionen werden täglich oder automatisch aktualisiert.', 1, 5, 'erfüllt', '2026-05-09'),
(17, 'Schutz vor Schadsoftware', 'Regelmäßige automatische Scans sind konfiguriert.', 1, 4, 'erfüllt', '2026-05-09'),
(18, 'Schutz vor Schadsoftware', 'Ausführung von Schadsoftware aus E-Mail-Anhängen und Webdownloads wird blockiert.', 1, 4, 'erfüllt', '2026-05-09'),
(19, 'Schutz vor Schadsoftware', 'Application Whitelisting oder vergleichbare Kontrollmechanismen sind implementiert.', 0, 3, 'nicht erfüllt', '2026-05-09'),
(20, 'Patch-Management', 'Betriebssysteme und Firmware aller Geräte werden innerhalb von 14 Tagen nach Veröffentlichung kritischer Patches aktualisiert.', 1, 5, 'erfüllt', '2026-05-09'),
(21, 'Patch-Management', 'Anwendungssoftware wird innerhalb von 14 Tagen nach Veröffentlichung kritischer Patches aktualisiert.', 1, 5, 'erfüllt', '2026-05-09'),
(22, 'Patch-Management', 'Software, die vom Hersteller nicht mehr unterstützt wird (End-of-Life), ist nicht im Einsatz.', 1, 5, 'erfüllt', '2026-05-09'),
(23, 'Patch-Management', 'Ein Inventar aller eingesetzten Hard- und Software inkl. Versionsstand ist gepflegt.', 1, 4, 'erfüllt', '2026-05-09'),
(24, 'Patch-Management', 'Patches werden vor dem Einspielen in einer Testumgebung geprüft.', 0, 2, 'teilw.', '2026-05-09');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AuditDSGVO`
--

CREATE TABLE `AuditDSGVO` (
  `id` int(11) NOT NULL,
  `Kapitel` varchar(200) NOT NULL,
  `Frage` text NOT NULL,
  `pflicht` tinyint(1) DEFAULT 0,
  `gewichtung` int(11) DEFAULT 3,
  `status` varchar(30) DEFAULT 'offen',
  `datum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `AuditDSGVO`
--

INSERT INTO `AuditDSGVO` (`id`, `Kapitel`, `Frage`, `pflicht`, `gewichtung`, `status`, `datum`) VALUES
(1, 'Art. 5 – Grundsätze der Verarbeitung', 'Personenbezogene Daten werden nur für festgelegte, eindeutige und legitime Zwecke erhoben (Zweckbindung).', 1, 5, 'offen', NULL),
(2, 'Art. 5 – Grundsätze der Verarbeitung', 'Die Verarbeitung ist auf das notwendige Maß beschränkt (Datensparsamkeit).', 1, 5, 'offen', NULL),
(3, 'Art. 5 – Grundsätze der Verarbeitung', 'Daten werden nur so lange gespeichert wie notwendig (Speicherbegrenzung).', 1, 5, 'offen', NULL),
(4, 'Art. 5 – Grundsätze der Verarbeitung', 'Die Verarbeitung erfolgt rechtmäßig, transparent und nach Treu und Glauben.', 1, 5, 'offen', NULL),
(5, 'Art. 5 – Grundsätze der Verarbeitung', 'Sachliche Richtigkeit der Daten wird sichergestellt und Daten werden ggf. berichtigt.', 1, 4, 'offen', NULL),
(6, 'Art. 6/9 – Rechtsgrundlagen', 'Für jede Verarbeitungstätigkeit liegt eine dokumentierte Rechtsgrundlage vor.', 1, 5, 'offen', NULL),
(7, 'Art. 6/9 – Rechtsgrundlagen', 'Einwilligungen sind freiwillig, informiert und nachweisbar eingeholt.', 1, 5, 'offen', NULL),
(8, 'Art. 6/9 – Rechtsgrundlagen', 'Besondere Kategorien personenbezogener Daten (Art. 9) werden nur mit expliziter Rechtsgrundlage verarbeitet.', 1, 5, 'offen', NULL),
(9, 'Art. 12–14 – Informationspflichten', 'Betroffene werden bei Datenerhebung transparent über die Verarbeitung informiert (Datenschutzhinweise).', 1, 5, 'offen', NULL),
(10, 'Art. 12–14 – Informationspflichten', 'Datenschutzerklärungen sind aktuell, vollständig und leicht zugänglich.', 1, 4, 'offen', NULL),
(11, 'Art. 12–14 – Informationspflichten', 'Informationen werden in klarer und verständlicher Sprache bereitgestellt.', 1, 3, 'offen', NULL),
(12, 'Art. 15–22 – Betroffenenrechte', 'Prozesse zur Bearbeitung von Auskunftsanfragen (Art. 15) sind etabliert und innerhalb der Fristen umsetzbar.', 1, 5, 'offen', NULL),
(13, 'Art. 15–22 – Betroffenenrechte', 'Berichtigung (Art. 16), Löschung (Art. 17) und Einschränkung (Art. 18) können fristgerecht umgesetzt werden.', 1, 5, 'offen', NULL),
(14, 'Art. 15–22 – Betroffenenrechte', 'Widerspruchs- (Art. 21) und Widerrufsrechte (Art. 7 Abs. 3) werden ohne unangemessene Verzögerung bearbeitet.', 1, 4, 'offen', NULL),
(15, 'Art. 15–22 – Betroffenenrechte', 'Recht auf Datenübertragbarkeit (Art. 20) ist technisch umsetzbar.', 0, 3, 'offen', NULL),
(16, 'Art. 24/25 – Verantwortlichkeit & Privacy by Design', 'Privacy by Design und Privacy by Default sind in Entwicklungs- und Beschaffungsprozessen verankert.', 1, 5, 'offen', NULL),
(17, 'Art. 24/25 – Verantwortlichkeit & Privacy by Design', 'Technische und organisatorische Maßnahmen (TOMs) sind dokumentiert und aktuell.', 1, 5, 'offen', NULL),
(18, 'Art. 24/25 – Verantwortlichkeit & Privacy by Design', 'Datenschutz-Folgenabschätzungen (DSFA, Art. 35) werden bei risikoreichen Verarbeitungen durchgeführt.', 1, 5, 'offen', NULL),
(19, 'Art. 26–28 – Auftragsverarbeitung', 'Mit allen Auftragsverarbeitern sind schriftliche AVV nach Art. 28 DSGVO abgeschlossen.', 1, 5, 'offen', NULL),
(20, 'Art. 26–28 – Auftragsverarbeitung', 'Auftragsverarbeiter werden regelmäßig auf Einhaltung der DSGVO-Anforderungen überprüft.', 1, 4, 'offen', NULL),
(21, 'Art. 26–28 – Auftragsverarbeitung', 'Drittlandübermittlungen (Art. 44 ff.) erfolgen nur mit geeigneten Garantien (z.B. SCC, Angemessenheitsbeschluss).', 1, 5, 'offen', NULL),
(22, 'Art. 30 – Verzeichnis der Verarbeitungstätigkeiten (VVT)', 'Ein aktuelles Verzeichnis aller Verarbeitungstätigkeiten (VVT) ist vorhanden.', 1, 5, 'offen', NULL),
(23, 'Art. 30 – Verzeichnis der Verarbeitungstätigkeiten (VVT)', 'Das VVT enthält alle Pflichtangaben gemäß Art. 30 DSGVO.', 1, 5, 'offen', NULL),
(24, 'Art. 30 – Verzeichnis der Verarbeitungstätigkeiten (VVT)', 'Das VVT wird bei neuen oder geänderten Verarbeitungen aktualisiert.', 1, 4, 'offen', NULL),
(25, 'Art. 32 – Technische & Organisatorische Maßnahmen (TOMs)', 'Zugangs-, Zugriffs- und Weitergabekontrolle sind implementiert und dokumentiert.', 1, 5, 'offen', NULL),
(26, 'Art. 32 – Technische & Organisatorische Maßnahmen (TOMs)', 'Daten werden bei Übertragung und Speicherung verschlüsselt (Verschlüsselungskonzept vorhanden).', 1, 5, 'offen', NULL),
(27, 'Art. 32 – Technische & Organisatorische Maßnahmen (TOMs)', 'Pseudonymisierung und Anonymisierung werden eingesetzt, wo technisch möglich.', 0, 3, 'offen', NULL),
(28, 'Art. 32 – Technische & Organisatorische Maßnahmen (TOMs)', 'Verfügbarkeit und Belastbarkeit der Systeme werden durch Backups und BCM sichergestellt.', 1, 4, 'offen', NULL),
(29, 'Art. 32 – Technische & Organisatorische Maßnahmen (TOMs)', 'TOMs werden regelmäßig überprüft und bei Bedarf angepasst.', 1, 4, 'offen', NULL),
(30, 'Art. 33/34 – Meldepflichten bei Datenpannen', 'Ein Prozess zur Erkennung, Dokumentation und Meldung von Datenpannen ist etabliert.', 1, 5, 'offen', NULL),
(31, 'Art. 33/34 – Meldepflichten bei Datenpannen', 'Datenpannen werden binnen 72 Stunden der zuständigen Aufsichtsbehörde gemeldet (Art. 33).', 1, 5, 'offen', NULL),
(32, 'Art. 33/34 – Meldepflichten bei Datenpannen', 'Betroffene Personen werden bei hohem Risiko unverzüglich benachrichtigt (Art. 34).', 1, 5, 'offen', NULL),
(33, 'Art. 33/34 – Meldepflichten bei Datenpannen', 'Datenpannen werden intern dokumentiert (Panning-Register).', 1, 4, 'offen', NULL),
(34, 'Art. 37–39 – Datenschutzbeauftragter (DSB)', 'Es wurde geprüft, ob ein DSB benannt werden muss; das Ergebnis ist dokumentiert.', 1, 5, 'offen', NULL),
(35, 'Art. 37–39 – Datenschutzbeauftragter (DSB)', 'Wenn erforderlich: ein DSB ist benannt, bei der Behörde registriert und seine Kontaktdaten sind veröffentlicht.', 1, 5, 'offen', NULL),
(36, 'Art. 37–39 – Datenschutzbeauftragter (DSB)', 'Der DSB wird frühzeitig in alle datenschutzrelevanten Vorgänge eingebunden.', 1, 4, 'offen', NULL),
(37, 'Schulung & Datenschutzbewusstsein', 'Mitarbeitende werden regelmäßig zum Datenschutz geschult und sensibilisiert.', 1, 4, 'offen', NULL),
(38, 'Schulung & Datenschutzbewusstsein', 'Schulungsnachweise werden dokumentiert.', 0, 3, 'offen', NULL),
(39, 'Schulung & Datenschutzbewusstsein', 'Neue Mitarbeitende werden bei Eintritt über Datenschutzpflichten informiert.', 1, 4, 'offen', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AuditNIS2`
--

CREATE TABLE `AuditNIS2` (
  `id` int(11) NOT NULL,
  `Kapitel` varchar(200) NOT NULL,
  `Frage` text NOT NULL,
  `pflicht` tinyint(1) DEFAULT 0,
  `gewichtung` int(11) DEFAULT 3,
  `status` varchar(30) DEFAULT 'offen',
  `datum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `AuditNIS2`
--

INSERT INTO `AuditNIS2` (`id`, `Kapitel`, `Frage`, `pflicht`, `gewichtung`, `status`, `datum`) VALUES
(1, 'Art. 21 – Risikoanalyse & Sicherheitspolitik', 'Es existiert eine dokumentierte Informationssicherheitsrichtlinie (IS-Policy).', 1, 5, 'offen', NULL),
(2, 'Art. 21 – Risikoanalyse & Sicherheitspolitik', 'Es wird regelmäßig (mind. jährlich) eine Risikoanalyse für Netz- und Informationssysteme durchgeführt.', 1, 5, 'offen', NULL),
(3, 'Art. 21 – Risikoanalyse & Sicherheitspolitik', 'Die Risikoanalyse wird dokumentiert und die Ergebnisse werden der Geschäftsleitung vorgelegt.', 1, 4, 'offen', NULL),
(4, 'Art. 21 – Risikoanalyse & Sicherheitspolitik', 'Sicherheitsziele sind messbar definiert und werden regelmäßig überprüft.', 0, 3, 'offen', NULL),
(5, 'Art. 21 – Vorfallbewältigung', 'Ein dokumentiertes Incident-Response-Verfahren ist vorhanden und bekannt.', 1, 5, 'offen', NULL),
(6, 'Art. 21 – Vorfallbewältigung', 'Sicherheitsvorfälle werden klassifiziert (erheblich / nicht erheblich) und protokolliert.', 1, 5, 'offen', NULL),
(7, 'Art. 21 – Vorfallbewältigung', 'Meldepflichten gegenüber der zuständigen Behörde (BSI/ENISA) sind bekannt und eingehalten (Frühwarnung 24h, Meldung 72h, Abschlussbericht).', 1, 5, 'offen', NULL),
(8, 'Art. 21 – Vorfallbewältigung', 'Sicherheitsvorfälle werden nach Abschluss ausgewertet (Post-Incident Review).', 0, 3, 'offen', NULL),
(9, 'Art. 21 – Business Continuity & BCM', 'Ein Business-Continuity-Plan (BCP) für kritische Dienste ist vorhanden.', 1, 5, 'offen', NULL),
(10, 'Art. 21 – Business Continuity & BCM', 'Backup-Verfahren für kritische Systeme sind implementiert und werden regelmäßig getestet.', 1, 5, 'offen', NULL),
(11, 'Art. 21 – Business Continuity & BCM', 'Wiederanlaufpläne (DRP) sind dokumentiert und erprobt.', 1, 4, 'offen', NULL),
(12, 'Art. 21 – Business Continuity & BCM', 'Notfallübungen (Tabletop/Simulationen) werden mind. jährlich durchgeführt.', 0, 3, 'offen', NULL),
(13, 'Art. 21 – Lieferkettensicherheit', 'Lieferanten und Dienstleister werden hinsichtlich ihrer Sicherheitsmaßnahmen bewertet.', 1, 5, 'offen', NULL),
(14, 'Art. 21 – Lieferkettensicherheit', 'Sicherheitsanforderungen sind vertraglich mit Dritten vereinbart.', 1, 4, 'offen', NULL),
(15, 'Art. 21 – Lieferkettensicherheit', 'Kritische Abhängigkeiten in der Lieferkette sind identifiziert und dokumentiert.', 1, 4, 'offen', NULL),
(16, 'Art. 21 – Lieferkettensicherheit', 'Regelmäßige Überprüfung der Lieferantensicherheit (Audits, Fragebögen) findet statt.', 0, 3, 'offen', NULL),
(17, 'Art. 21 – Sicherheit in Entwicklung & Beschaffung', 'Security-by-Design ist in den Entwicklungsprozess integriert.', 1, 4, 'offen', NULL),
(18, 'Art. 21 – Sicherheit in Entwicklung & Beschaffung', 'Sichere Konfigurationsstandards (Hardening) werden für Systeme angewendet.', 1, 4, 'offen', NULL),
(19, 'Art. 21 – Sicherheit in Entwicklung & Beschaffung', 'Schwachstellen-Management und Patch-Management-Prozesse sind etabliert.', 1, 5, 'offen', NULL),
(20, 'Art. 21 – Sicherheit in Entwicklung & Beschaffung', 'Penetrationstests oder Sicherheitsaudits von Anwendungen werden regelmäßig durchgeführt.', 0, 3, 'offen', NULL),
(21, 'Art. 21 – Wirksamkeitsbewertung', 'Die Wirksamkeit der Sicherheitsmaßnahmen wird regelmäßig gemessen und bewertet.', 1, 4, 'offen', NULL),
(22, 'Art. 21 – Wirksamkeitsbewertung', 'Interne Audits oder Reviews der Sicherheitsmaßnahmen werden durchgeführt.', 1, 4, 'offen', NULL),
(23, 'Art. 21 – Wirksamkeitsbewertung', 'KPIs/Metriken für Informationssicherheit sind definiert.', 0, 3, 'offen', NULL),
(24, 'Art. 21 – Cyberhygiene & Schulungen', 'Regelmäßige Sicherheitsschulungen und Awareness-Programme für Mitarbeitende sind etabliert.', 1, 5, 'offen', NULL),
(25, 'Art. 21 – Cyberhygiene & Schulungen', 'Grundlegende Cyberhygiene-Maßnahmen (Passwortrichtlinien, Updates, Clean-Desk etc.) sind umgesetzt.', 1, 4, 'offen', NULL),
(26, 'Art. 21 – Cyberhygiene & Schulungen', 'Schulungsnachweise werden dokumentiert.', 0, 3, 'offen', NULL),
(27, 'Art. 21 – Cyberhygiene & Schulungen', 'Phishing-Simulationen oder ähnliche Tests werden regelmäßig durchgeführt.', 0, 3, 'offen', NULL),
(28, 'Art. 21 – Kryptographie & Verschlüsselung', 'Eine Kryptographierichtlinie ist vorhanden und aktuell.', 1, 4, 'offen', NULL),
(29, 'Art. 21 – Kryptographie & Verschlüsselung', 'Verschlüsselung wird für sensitive Daten (at rest und in transit) eingesetzt.', 1, 5, 'offen', NULL),
(30, 'Art. 21 – Kryptographie & Verschlüsselung', 'Schlüsselverwaltungsprozesse sind dokumentiert und implementiert.', 1, 4, 'offen', NULL),
(31, 'Art. 21 – Personalsicherheit & Zugangskontrolle', 'Zugriffsrechte werden nach dem Least-Privilege-Prinzip vergeben.', 1, 5, 'offen', NULL),
(32, 'Art. 21 – Personalsicherheit & Zugangskontrolle', 'Berechtigungen werden bei Austritt oder Rollenwechsel umgehend entzogen.', 1, 5, 'offen', NULL),
(33, 'Art. 21 – Personalsicherheit & Zugangskontrolle', 'Privilegierte Konten (Admin-Accounts) sind inventarisiert und besonders geschützt.', 1, 4, 'offen', NULL),
(34, 'Art. 21 – Personalsicherheit & Zugangskontrolle', 'Multi-Faktor-Authentifizierung (MFA) ist für kritische Systeme und Remote-Zugriff umgesetzt.', 1, 5, 'offen', NULL),
(35, 'Art. 21 – Personalsicherheit & Zugangskontrolle', 'Hintergrundüberprüfungen für Stellen mit sensiblem Systemzugang werden durchgeführt.', 0, 3, 'offen', NULL),
(36, 'Art. 21 – Asset-Management', 'Ein aktuelles Inventar aller kritischen Netz- und Informationssysteme ist vorhanden.', 1, 5, 'offen', NULL),
(37, 'Art. 21 – Asset-Management', 'Assets werden klassifiziert (Kritikalität, Schutzbedarf).', 1, 4, 'offen', NULL),
(38, 'Art. 21 – Asset-Management', 'Verantwortliche (Owner) für kritische Assets sind benannt.', 1, 3, 'offen', NULL),
(39, 'Art. 21 – Physische Sicherheit', 'Physische Zugangskontrollen für IT-Infrastruktur (Rechenzentrum, Server) sind implementiert.', 1, 4, 'offen', NULL),
(40, 'Art. 21 – Physische Sicherheit', 'Schutz vor Umweltbedrohungen (Brand, Wasser, Strom) ist gewährleistet.', 1, 4, 'offen', NULL),
(41, 'Art. 21 – Physische Sicherheit', 'Physische Sicherheitsmaßnahmen werden regelmäßig überprüft.', 0, 3, 'offen', NULL),
(42, 'Art. 21 – Netzwerksicherheit', 'Netzwerksegmentierung ist umgesetzt (z.B. DMZ, VLANs).', 1, 5, 'offen', NULL),
(43, 'Art. 21 – Netzwerksicherheit', 'Netzwerkverkehr wird überwacht und protokolliert (IDS/IPS, SIEM).', 1, 4, 'offen', NULL),
(44, 'Art. 21 – Netzwerksicherheit', 'Remote-Zugriffe sind abgesichert (VPN, Zero Trust).', 1, 5, 'offen', NULL),
(45, 'Art. 21 – Netzwerksicherheit', 'Firewalls und Perimeter-Schutz sind konfiguriert und aktuell.', 1, 4, 'offen', NULL),
(46, 'Art. 20 – Governance & Leitungsverantwortung', 'Die Leitungsebene hat die Cybersicherheitsmaßnahmen formell gebilligt.', 1, 5, 'offen', NULL),
(47, 'Art. 20 – Governance & Leitungsverantwortung', 'Ein Verantwortlicher für Informationssicherheit (CISO/ISB) ist benannt.', 1, 5, 'offen', NULL),
(48, 'Art. 20 – Governance & Leitungsverantwortung', 'Die Leitungsebene wird regelmäßig über den Sicherheitsstatus informiert.', 1, 4, 'offen', NULL),
(49, 'Art. 20 – Governance & Leitungsverantwortung', 'Leitungspersonen haben nachweislich an Schulungen zu Cybersicherheit teilgenommen.', 1, 4, 'offen', NULL),
(50, 'Art. 23 – Meldepflichten bei erheblichen Vorfällen', 'Prozesse zur Identifikation erheblicher Sicherheitsvorfälle sind vorhanden.', 1, 5, 'offen', NULL),
(51, 'Art. 23 – Meldepflichten bei erheblichen Vorfällen', 'Kontaktdaten und Meldeweg zur zuständigen Behörde (z.B. BSI) sind bekannt und dokumentiert.', 1, 5, 'offen', NULL),
(52, 'Art. 23 – Meldepflichten bei erheblichen Vorfällen', 'Frühwarnung (24h), Meldung (72h) und Abschlussbericht (1 Monat) können fristgerecht erfolgen.', 1, 5, 'offen', NULL),
(53, 'Art. 23 – Meldepflichten bei erheblichen Vorfällen', 'Kommunikationspläne für Behörden und ggf. Öffentlichkeit (Art. 23 Abs. 3) sind vorbereitet.', 0, 3, 'offen', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AuditTISAX`
--

CREATE TABLE `AuditTISAX` (
  `id` int(11) NOT NULL,
  `Kapitel` varchar(200) NOT NULL,
  `Frage` text NOT NULL,
  `pflicht` tinyint(1) DEFAULT 0,
  `gewichtung` int(11) DEFAULT 3,
  `status` varchar(30) DEFAULT 'offen',
  `datum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `AuditTISAX`
--

INSERT INTO `AuditTISAX` (`id`, `Kapitel`, `Frage`, `pflicht`, `gewichtung`, `status`, `datum`) VALUES
(1, '1. Informationssicherheitsmanagement', 'Eine Informationssicherheitsleitlinie ist von der Geschäftsleitung verabschiedet und kommuniziert.', 1, 5, 'offen', NULL),
(2, '1. Informationssicherheitsmanagement', 'Ein Informationssicherheitsmanagementsystem (ISMS) ist implementiert und wird aufrechterhalten.', 1, 5, 'offen', NULL),
(3, '1. Informationssicherheitsmanagement', 'Ein CISO oder verantwortlicher IS-Beauftragter ist benannt.', 1, 5, 'offen', NULL),
(4, '1. Informationssicherheitsmanagement', 'Das ISMS wird regelmäßig überprüft und kontinuierlich verbessert (KVP).', 1, 4, 'offen', NULL),
(5, '1. Informationssicherheitsmanagement', 'Management-Reviews zur Informationssicherheit finden mindestens jährlich statt.', 1, 4, 'offen', NULL),
(6, '2. Risikomanagement', 'Ein dokumentierter Risikomanagementprozess für Informationssicherheit ist etabliert.', 1, 5, 'offen', NULL),
(7, '2. Risikomanagement', 'Informationssicherheitsrisiken werden regelmäßig identifiziert, bewertet und behandelt.', 1, 5, 'offen', NULL),
(8, '2. Risikomanagement', 'Risikobehandlungspläne werden verfolgt und deren Wirksamkeit überprüft.', 1, 4, 'offen', NULL),
(9, '2. Risikomanagement', 'Restrisiken sind von der Geschäftsleitung akzeptiert und dokumentiert.', 1, 4, 'offen', NULL),
(10, '3. Asset-Management & Schutzbedarfsfeststellung', 'Alle informationsverarbeitenden Assets sind inventarisiert (Asset-Register).', 1, 5, 'offen', NULL),
(11, '3. Asset-Management & Schutzbedarfsfeststellung', 'Schutzbedarf von Informationen und Systemen ist nach Vertraulichkeit, Integrität, Verfügbarkeit festgestellt.', 1, 5, 'offen', NULL),
(12, '3. Asset-Management & Schutzbedarfsfeststellung', 'Schutzbedarfskategorien sind definiert und werden bei der Auswahl von Maßnahmen berücksichtigt.', 1, 4, 'offen', NULL),
(13, '3. Asset-Management & Schutzbedarfsfeststellung', 'Informationen von OEM-Kunden (z.B. Konstruktionsdaten) sind klassifiziert und besonders geschützt.', 1, 5, 'offen', NULL),
(14, '4. Physische Sicherheit', 'Serverräume und Bereiche mit schutzbedürftigen Informationen sind gegen unbefugten Zutritt gesichert.', 1, 5, 'offen', NULL),
(15, '4. Physische Sicherheit', 'Zutrittskontrollsystem ist implementiert; Zutrittsrechte werden regelmäßig überprüft.', 1, 5, 'offen', NULL),
(16, '4. Physische Sicherheit', 'Besucher werden registriert und begleitet.', 1, 4, 'offen', NULL),
(17, '4. Physische Sicherheit', 'Schutz gegen Feuer, Wasser und sonstige Umwelteinflüsse ist vorhanden.', 1, 4, 'offen', NULL),
(18, '4. Physische Sicherheit', 'Prototypen und schutzbedürftige physische Objekte sind gesichert (Prototypenschutz).', 1, 5, 'offen', NULL),
(19, '5. Personal & Schulungen', 'Mitarbeitende werden vor Aufnahme der Tätigkeit auf Zuverlässigkeit geprüft (Hintergrundüberprüfung, soweit rechtlich zulässig).', 1, 4, 'offen', NULL),
(20, '5. Personal & Schulungen', 'Mitarbeitende werden regelmäßig zur Informationssicherheit und Vertraulichkeit geschult.', 1, 5, 'offen', NULL),
(21, '5. Personal & Schulungen', 'Geheimhaltungsvereinbarungen (NDA) sind mit Mitarbeitenden und relevanten Dritten abgeschlossen.', 1, 5, 'offen', NULL),
(22, '5. Personal & Schulungen', 'Beim Ausscheiden werden Zugriffsrechte entzogen und Assets zurückgegeben.', 1, 5, 'offen', NULL),
(23, '6. Zugriffsmanagement', 'Zugriffsrechte werden nach dem Least-Privilege-Prinzip vergeben und regelmäßig überprüft.', 1, 5, 'offen', NULL),
(24, '6. Zugriffsmanagement', 'Administrative Zugänge sind besonders gesichert (MFA, Protokollierung).', 1, 5, 'offen', NULL),
(25, '6. Zugriffsmanagement', 'Remote-Zugriffe erfolgen ausschließlich über verschlüsselte und authentifizierte Verbindungen.', 1, 5, 'offen', NULL),
(26, '6. Zugriffsmanagement', 'Passwortrichtlinien mit Mindestanforderungen sind definiert und durchgesetzt.', 1, 4, 'offen', NULL),
(27, '7. Kryptographie', 'Eine Kryptographierichtlinie mit aktuellen Algorithmen und Schlüssellängen ist vorhanden.', 1, 4, 'offen', NULL),
(28, '7. Kryptographie', 'Schutzbedürftige Daten werden bei Übertragung und Speicherung verschlüsselt.', 1, 5, 'offen', NULL),
(29, '7. Kryptographie', 'Zertifikats- und Schlüsselverwaltung ist geregelt (Gültigkeiten, Erneuerung, Widerruf).', 1, 4, 'offen', NULL),
(30, '8. IT- & Netzwerksicherheit', 'Netzwerke sind segmentiert; schutzbedürftige Systeme sind in separaten Zonen.', 1, 5, 'offen', NULL),
(31, '8. IT- & Netzwerksicherheit', 'Schadsoftware-Schutz ist auf allen relevanten Endpunkten implementiert und aktuell.', 1, 5, 'offen', NULL),
(32, '8. IT- & Netzwerksicherheit', 'Patch- und Schwachstellenmanagement ist etabliert; kritische Patches werden zeitnah eingespielt.', 1, 5, 'offen', NULL),
(33, '8. IT- & Netzwerksicherheit', 'Netzwerkzugriffe werden protokolliert und überwacht.', 1, 4, 'offen', NULL),
(34, '8. IT- & Netzwerksicherheit', 'WLAN-Netze sind sicher konfiguriert und von Produktionsnetzen getrennt.', 1, 4, 'offen', NULL),
(35, '9. Lieferanten & Dienstleister', 'Informationssicherheitsanforderungen sind vertraglich mit Lieferanten und Dienstleistern vereinbart.', 1, 5, 'offen', NULL),
(36, '9. Lieferanten & Dienstleister', 'Lieferanten werden hinsichtlich Informationssicherheit bewertet (z.B. TISAX-Nachweis oder Audit).', 1, 5, 'offen', NULL),
(37, '9. Lieferanten & Dienstleister', 'Zugriffe von Dritten auf interne Systeme und Daten werden kontrolliert und protokolliert.', 1, 4, 'offen', NULL),
(38, '9. Lieferanten & Dienstleister', 'Die Weitergabe schutzbedürftiger Kundeninformationen an Dritte ist geregelt und genehmigt.', 1, 5, 'offen', NULL),
(39, '10. Vorfallmanagement', 'Ein Incident-Response-Prozess für Informationssicherheitsvorfälle ist dokumentiert und erprobt.', 1, 5, 'offen', NULL),
(40, '10. Vorfallmanagement', 'Sicherheitsvorfälle werden klassifiziert, dokumentiert und analysiert.', 1, 5, 'offen', NULL),
(41, '10. Vorfallmanagement', 'OEM-Kunden werden bei sicherheitsrelevanten Vorfällen mit Auswirkung auf deren Daten informiert.', 1, 5, 'offen', NULL),
(42, '10. Vorfallmanagement', 'Post-Incident-Reviews führen zu dokumentierten Verbesserungsmaßnahmen.', 0, 3, 'offen', NULL),
(43, '11. Business Continuity Management', 'Ein Business-Continuity-Plan (BCP) für kritische Prozesse und Systeme ist vorhanden.', 1, 5, 'offen', NULL),
(44, '11. Business Continuity Management', 'Backups werden regelmäßig erstellt, verschlüsselt gespeichert und auf Wiederherstellbarkeit getestet.', 1, 5, 'offen', NULL),
(45, '11. Business Continuity Management', 'BCM-Tests und Notfallübungen werden mindestens jährlich durchgeführt.', 1, 4, 'offen', NULL),
(46, '11. Business Continuity Management', 'RTO und RPO sind für kritische Systeme definiert und werden eingehalten.', 1, 4, 'offen', NULL),
(47, '12. Compliance & Audit', 'Interne Audits zur Informationssicherheit werden regelmäßig durchgeführt.', 1, 5, 'offen', NULL),
(48, '12. Compliance & Audit', 'TISAX-Anforderungen sind bekannt; ein TISAX-Assessment ist geplant oder durchgeführt.', 1, 5, 'offen', NULL),
(49, '12. Compliance & Audit', 'Maßnahmen aus Audits und Assessments werden nachverfolgt und abgearbeitet.', 1, 4, 'offen', NULL),
(50, '12. Compliance & Audit', 'Rechtliche und vertragliche Anforderungen zur Informationssicherheit (inkl. OEM-Vorgaben) sind bekannt und eingehalten.', 1, 5, 'offen', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AuditVdS`
--

CREATE TABLE `AuditVdS` (
  `id` int(11) NOT NULL,
  `Kapitel` varchar(255) NOT NULL,
  `Frage` text NOT NULL,
  `pflicht` tinyint(1) DEFAULT 0,
  `gewichtung` int(11) DEFAULT 1,
  `status` varchar(50) DEFAULT 'offen',
  `datum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `AuditVdS`
--

INSERT INTO `AuditVdS` (`id`, `Kapitel`, `Frage`, `pflicht`, `gewichtung`, `status`, `datum`) VALUES
(1, '1. Organisation & Managementsystem', 'Eine Informationssicherheits-Leitlinie (IS-Policy) ist dokumentiert, von der Geschäftsführung verabschiedet und kommuniziert.', 1, 5, 'offen', NULL),
(2, '1. Organisation & Managementsystem', 'Verantwortlichkeiten für Informationssicherheit sind schriftlich geregelt (IS-Beauftragter oder gleichwertige Funktion).', 1, 5, 'offen', NULL),
(3, '1. Organisation & Managementsystem', 'Informationssicherheit ist in Geschäftsprozesse und Projekte integriert.', 1, 4, 'offen', NULL),
(4, '1. Organisation & Managementsystem', 'Regelmäßige Management-Reviews zur Informationssicherheit finden statt (mind. jährlich).', 1, 4, 'offen', NULL),
(5, '1. Organisation & Managementsystem', 'Ein Verbesserungsprozess (KVP) für die Informationssicherheit ist etabliert.', 0, 3, 'offen', NULL),
(6, '2. Risikomanagement', 'Ein dokumentiertes Risikoanalyseverfahren für Informationssicherheit ist vorhanden.', 1, 5, 'offen', NULL),
(7, '2. Risikomanagement', 'Risiken werden regelmäßig (mind. jährlich) identifiziert, bewertet und behandelt.', 1, 5, 'offen', NULL),
(8, '2. Risikomanagement', 'Risikoakzeptanzkriterien sind definiert und dokumentiert.', 1, 4, 'offen', NULL),
(9, '2. Risikomanagement', 'Ergebnisse der Risikobehandlung werden verfolgt und dokumentiert.', 1, 4, 'offen', NULL),
(10, '2. Risikomanagement', 'Risiken für Lieferketten und Drittparteien werden berücksichtigt.', 0, 3, 'offen', NULL),
(11, '3. Personal & Sensibilisierung', 'Mitarbeiter werden bei Einstellung und regelmäßig zu Informationssicherheit geschult.', 1, 5, 'offen', NULL),
(12, '3. Personal & Sensibilisierung', 'Sicherheitsrichtlinien werden von Mitarbeitern nachweislich zur Kenntnis genommen.', 1, 4, 'offen', NULL),
(13, '3. Personal & Sensibilisierung', 'Beim Ausscheiden von Mitarbeitern werden Zugänge umgehend entzogen und Assets zurückgefordert.', 1, 5, 'offen', NULL),
(14, '3. Personal & Sensibilisierung', 'Für sicherheitsrelevante Rollen existieren spezifische Schulungsmaßnahmen.', 0, 3, 'offen', NULL),
(15, '4. Asset-Management', 'Ein aktuelles Inventar aller informationsverarbeitenden Assets (Hard- und Software) wird gepflegt.', 1, 5, 'offen', NULL),
(16, '4. Asset-Management', 'Alle Assets sind einem Verantwortlichen (Owner) zugeordnet.', 1, 4, 'offen', NULL),
(17, '4. Asset-Management', 'Informationen sind nach Schutzbedarf klassifiziert.', 1, 4, 'offen', NULL),
(18, '4. Asset-Management', 'Regelungen zur Handhabung von Wechseldatenträgern und mobilen Geräten sind vorhanden.', 1, 4, 'offen', NULL),
(19, '4. Asset-Management', 'Eine geregelte Entsorgung von Datenträgern (Datenlöschung/-vernichtung) ist dokumentiert.', 1, 4, 'offen', NULL),
(20, '5. Zugriffskontrolle & Identitätsmanagement', 'Zugriffsrechte werden nach dem Least-Privilege-Prinzip vergeben und regelmäßig überprüft.', 1, 5, 'offen', NULL),
(21, '5. Zugriffskontrolle & Identitätsmanagement', 'Administrative Berechtigungen sind auf das notwendige Minimum beschränkt.', 1, 5, 'offen', NULL),
(22, '5. Zugriffskontrolle & Identitätsmanagement', 'Ein Passwort-/Authentifizierungskonzept mit Mindestanforderungen ist dokumentiert und umgesetzt.', 1, 5, 'offen', NULL),
(23, '5. Zugriffskontrolle & Identitätsmanagement', 'Multi-Faktor-Authentifizierung ist für Remote-Zugriffe und privilegierte Konten eingesetzt.', 1, 5, 'offen', NULL),
(24, '5. Zugriffskontrolle & Identitätsmanagement', 'Benutzerkonten werden bei Ausscheiden oder Rollenwechsel unverzüglich angepasst.', 1, 4, 'offen', NULL),
(25, '6. Kryptografie', 'Eine Kryptografierichtlinie mit Vorgaben zu Algorithmen und Schlüssellängen ist vorhanden.', 1, 4, 'offen', NULL),
(26, '6. Kryptografie', 'Sensitive Daten werden bei Übertragung und Speicherung verschlüsselt.', 1, 5, 'offen', NULL),
(27, '6. Kryptografie', 'Zertifikats- und Schlüsselverwaltung ist geregelt (Lebenszyklusmanagement).', 1, 4, 'offen', NULL),
(28, '7. Physische Sicherheit', 'Serverräume und IT-Infrastruktur sind gegen unbefugten Zutritt gesichert.', 1, 5, 'offen', NULL),
(29, '7. Physische Sicherheit', 'Zutrittskontrolle zu sensitiven Bereichen ist dokumentiert und wird protokolliert.', 1, 4, 'offen', NULL),
(30, '7. Physische Sicherheit', 'Schutzmaßnahmen gegen Feuer, Wasser und Umwelteinflüsse sind vorhanden.', 1, 4, 'offen', NULL),
(31, '7. Physische Sicherheit', 'Clean-Desk-Richtlinie und Schutz vor Sichtbarkeit sensibler Informationen sind umgesetzt.', 0, 3, 'offen', NULL),
(32, '8. Betriebssicherheit', 'Betriebsdokumentation (Betriebshandbücher, Konfigurationen) ist aktuell gepflegt.', 1, 4, 'offen', NULL),
(33, '8. Betriebssicherheit', 'Änderungen an IT-Systemen unterliegen einem geregelten Change-Management-Prozess.', 1, 5, 'offen', NULL),
(34, '8. Betriebssicherheit', 'Kapazitäten werden überwacht und geplant (Kapazitätsmanagement).', 0, 3, 'offen', NULL),
(35, '8. Betriebssicherheit', 'Test- und Entwicklungsumgebungen sind von Produktivumgebungen getrennt.', 1, 4, 'offen', NULL),
(36, '8. Betriebssicherheit', 'Schadsoftware-Schutz ist auf allen relevanten Systemen installiert und aktuell.', 1, 5, 'offen', NULL),
(37, '8. Betriebssicherheit', 'Sicherheitsrelevante Ereignisse werden protokolliert und Logs regelmäßig ausgewertet.', 1, 4, 'offen', NULL),
(38, '9. Netzwerksicherheit', 'Das Netzwerk ist segmentiert; kritische Systeme sind in separaten Zonen.', 1, 5, 'offen', NULL),
(39, '9. Netzwerksicherheit', 'Netzwerkzugänge (intern/extern) werden durch Firewalls oder äquivalente Systeme kontrolliert.', 1, 5, 'offen', NULL),
(40, '9. Netzwerksicherheit', 'Fernzugriffe auf das Netzwerk erfolgen ausschließlich über gesicherte Verbindungen (VPN/verschlüsselt).', 1, 5, 'offen', NULL),
(41, '9. Netzwerksicherheit', 'WLAN-Netzwerke sind von Produktivnetzwerken getrennt und sicher konfiguriert.', 1, 4, 'offen', NULL),
(42, '9. Netzwerksicherheit', 'Netzwerkaktivitäten werden überwacht (IDS/IPS oder vergleichbar).', 0, 3, 'offen', NULL),
(43, '10. Lieferanten & Drittparteien', 'Sicherheitsanforderungen an Lieferanten und Dienstleister sind vertraglich vereinbart.', 1, 5, 'offen', NULL),
(44, '10. Lieferanten & Drittparteien', 'Die Einhaltung der Sicherheitsanforderungen durch Dritte wird regelmäßig überprüft.', 1, 4, 'offen', NULL),
(45, '10. Lieferanten & Drittparteien', 'Zugriffe von Dritten auf interne Systeme werden kontrolliert und protokolliert.', 1, 4, 'offen', NULL),
(46, '10. Lieferanten & Drittparteien', 'AVV (Auftragsverarbeitungsvertrag) liegt für alle relevanten Dienstleister vor.', 1, 4, 'offen', NULL),
(47, '11. Vorfallmanagement', 'Ein dokumentierter Incident-Response-Prozess ist vorhanden und erprobt.', 1, 5, 'offen', NULL),
(48, '11. Vorfallmanagement', 'Sicherheitsvorfälle werden klassifiziert, dokumentiert und ausgewertet.', 1, 5, 'offen', NULL),
(49, '11. Vorfallmanagement', 'Meldepflichten (intern/extern, z.B. Datenschutzbehörde, BSI) sind bekannt und eingehalten.', 1, 5, 'offen', NULL),
(50, '11. Vorfallmanagement', 'Post-Incident-Reviews führen zu nachverfolgbaren Verbesserungsmaßnahmen.', 0, 3, 'offen', NULL),
(51, '12. Business Continuity & Notfallmanagement', 'Ein Business-Continuity-Plan (BCP) für kritische Geschäftsprozesse ist dokumentiert.', 1, 5, 'offen', NULL),
(52, '12. Business Continuity & Notfallmanagement', 'Backup-Konzept ist vorhanden; Datensicherungen werden regelmäßig durchgeführt und getestet.', 1, 5, 'offen', NULL),
(53, '12. Business Continuity & Notfallmanagement', 'Wiederanlaufpläne (DRP) sind dokumentiert und Wiederanlaufzeiten (RTO/RPO) sind definiert.', 1, 4, 'offen', NULL),
(54, '12. Business Continuity & Notfallmanagement', 'BCM-Tests und Notfallübungen werden mind. jährlich durchgeführt.', 1, 4, 'offen', NULL),
(55, '13. Compliance & Datenschutz', 'Relevante gesetzliche und regulatorische Anforderungen (DSGVO, HGB, etc.) sind identifiziert und eingehalten.', 1, 5, 'offen', NULL),
(56, '13. Compliance & Datenschutz', 'Interne Audits zur Informationssicherheit werden regelmäßig (mind. jährlich) durchgeführt.', 1, 5, 'offen', NULL),
(57, '13. Compliance & Datenschutz', 'Ein Datenschutzkonzept und ein Verzeichnis von Verarbeitungstätigkeiten (VVT) sind vorhanden.', 1, 4, 'offen', NULL),
(58, '13. Compliance & Datenschutz', 'Verstöße gegen Sicherheitsrichtlinien werden konsequent verfolgt und dokumentiert.', 0, 3, 'offen', NULL),
(59, '14. Patch- & Schwachstellenmanagement', 'Ein strukturierter Prozess zur zeitnahen Einspielung von Sicherheits-Patches ist etabliert.', 1, 5, 'offen', NULL),
(60, '14. Patch- & Schwachstellenmanagement', 'Schwachstellen in IT-Systemen werden regelmäßig gescannt und bewertet.', 1, 5, 'offen', NULL),
(61, '14. Patch- & Schwachstellenmanagement', 'Kritische Schwachstellen werden innerhalb definierter Fristen behoben.', 1, 5, 'offen', NULL),
(62, '14. Patch- & Schwachstellenmanagement', 'Software, die vom Hersteller nicht mehr unterstützt wird (End-of-Life), ist nicht produktiv im Einsatz.', 1, 5, 'offen', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Auswirkung`
--

CREATE TABLE `Auswirkung` (
  `id` int(10) UNSIGNED NOT NULL,
  `Faktor` varchar(255) NOT NULL,
  `Unbedeutend` varchar(255) NOT NULL,
  `Gering` varchar(255) NOT NULL,
  `Mäßig` varchar(255) NOT NULL,
  `Groß` varchar(255) NOT NULL,
  `Katastrophal` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `Auswirkung`
--

INSERT INTO `Auswirkung` (`id`, `Faktor`, `Unbedeutend`, `Gering`, `Mäßig`, `Groß`, `Katastrophal`) VALUES
(1, 'Gesundheit & Sicherheit', 'Keine Verletzung oder Erkrankung', 'Leichte, isolierte Verletzung (keine Behandlung)', 'Lokale Verletzung (medizinisch behandelt)', 'Weitreichende oder mehrere Verletzungen', 'Todesfall oder Massenhospitalisierung'),
(2, 'Finanzen T€', 'kleiner 10', '10-50', '50-100', '100-500', '>500'),
(3, 'Service', 'Unterbrechung < 4 Std.', 'Unterbrechung 4–8 Std.', 'Unterbrechung 8 Std – 3 Arbeitstage', 'Unterbrechung 3 Arbeitstage – 2 Wochen', 'Ausfall mehr als 2 Wochen'),
(4, 'Recht & Compliance', 'Keine behördlichen Maßnahmen', 'Aufsichtsbehörde fordert Erklärung', 'Ordnungswidrigkeit mit Verstoßmeldung', 'Sanktionen und/oder Strafmaßnahmen', 'Strafverfolgung, Haftstrafe für Führungskräfte'),
(5, 'Reputation', 'Normales Beschwerdeaufkommen', 'Geringe Anmerkung oder Maßnahme', 'Reaktion bei Stakeholdern, nationale Berichte (< 3 Tage)', 'Nationale Medienberichte (1 Woche), Vorstand gefährdet', 'Medienberichte > 1 Woche, Entlassungsrisiko für Vorstand');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bcm_bia`
--

CREATE TABLE `bcm_bia` (
  `id` int(11) NOT NULL,
  `prozess_id` int(11) NOT NULL,
  `finanziell_1h` tinyint(4) DEFAULT 1,
  `finanziell_4h` tinyint(4) DEFAULT 1,
  `finanziell_24h` tinyint(4) DEFAULT 1,
  `finanziell_72h` tinyint(4) DEFAULT 1,
  `finanziell_1w` tinyint(4) DEFAULT 1,
  `operativ_1h` tinyint(4) DEFAULT 1,
  `operativ_4h` tinyint(4) DEFAULT 1,
  `operativ_24h` tinyint(4) DEFAULT 1,
  `operativ_72h` tinyint(4) DEFAULT 1,
  `operativ_1w` tinyint(4) DEFAULT 1,
  `regulatorisch_1h` tinyint(4) DEFAULT 1,
  `regulatorisch_4h` tinyint(4) DEFAULT 1,
  `regulatorisch_24h` tinyint(4) DEFAULT 1,
  `regulatorisch_72h` tinyint(4) DEFAULT 1,
  `regulatorisch_1w` tinyint(4) DEFAULT 1,
  `reputation_1h` tinyint(4) DEFAULT 1,
  `reputation_4h` tinyint(4) DEFAULT 1,
  `reputation_24h` tinyint(4) DEFAULT 1,
  `reputation_72h` tinyint(4) DEFAULT 1,
  `reputation_1w` tinyint(4) DEFAULT 1,
  `bemerkungen` text DEFAULT NULL,
  `abhaengigkeiten` text DEFAULT NULL,
  `ersteller` int(11) DEFAULT NULL,
  `erstellt` date DEFAULT NULL,
  `aenderer` int(11) DEFAULT NULL,
  `geaendert` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bcm_notfallplaene`
--

CREATE TABLE `bcm_notfallplaene` (
  `id` int(11) NOT NULL,
  `prozess_id` int(11) DEFAULT NULL,
  `nummer` varchar(20) DEFAULT NULL,
  `titel` varchar(200) NOT NULL,
  `typ` varchar(60) DEFAULT 'Notfallplan',
  `status` varchar(40) DEFAULT 'Entwurf',
  `version` varchar(20) DEFAULT '1.0',
  `gueltig_ab` date DEFAULT NULL,
  `gueltig_bis` date DEFAULT NULL,
  `inhalt` text DEFAULT NULL,
  `ersteller` int(11) DEFAULT NULL,
  `erstellt` date DEFAULT NULL,
  `aenderer` int(11) DEFAULT NULL,
  `geaendert` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bcm_prozesse`
--

CREATE TABLE `bcm_prozesse` (
  `id` int(11) NOT NULL,
  `nummer` varchar(20) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `kategorie` varchar(80) DEFAULT NULL,
  `kritikalitaet` varchar(20) DEFAULT 'mittel',
  `rto_stunden` int(11) DEFAULT 24,
  `rpo_stunden` int(11) DEFAULT 24,
  `maz_stunden` int(11) DEFAULT 72,
  `verantwortlich` int(11) DEFAULT NULL,
  `status` varchar(40) DEFAULT 'aktiv',
  `beschreibung` text DEFAULT NULL,
  `massnahmen` text DEFAULT NULL,
  `letzte_uebung` date DEFAULT NULL,
  `naechste_uebung` date DEFAULT NULL,
  `ersteller` int(11) DEFAULT NULL,
  `erstellt` date DEFAULT NULL,
  `aenderer` int(11) DEFAULT NULL,
  `geaendert` date DEFAULT NULL,
  `name_en` text DEFAULT NULL,
  `beschreibung_en` text DEFAULT NULL,
  `massnahmen_en` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bcm_uebungen`
--

CREATE TABLE `bcm_uebungen` (
  `id` int(11) NOT NULL,
  `prozess_id` int(11) DEFAULT NULL,
  `titel` varchar(200) NOT NULL,
  `typ` varchar(60) DEFAULT 'Tabletop',
  `datum` date DEFAULT NULL,
  `ergebnis` varchar(40) DEFAULT 'offen',
  `teilnehmer` text DEFAULT NULL,
  `erkenntnisse` text DEFAULT NULL,
  `ersteller` int(11) DEFAULT NULL,
  `erstellt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bcm_uebung_anhaenge`
--

CREATE TABLE `bcm_uebung_anhaenge` (
  `id` int(11) NOT NULL,
  `uebung_id` int(11) NOT NULL,
  `original_name` varchar(260) NOT NULL,
  `stored_name` varchar(300) NOT NULL,
  `rel_path` varchar(300) NOT NULL,
  `mime_type` varchar(120) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT 0,
  `beschreibung` varchar(300) DEFAULT NULL,
  `ersteller` int(11) DEFAULT NULL,
  `erstellt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bedrohungen`
--

CREATE TABLE `bedrohungen` (
  `id` int(11) UNSIGNED NOT NULL,
  `art` varchar(37) DEFAULT NULL,
  `name` varchar(38) DEFAULT NULL,
  `beschreibung` varchar(78) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Daten für Tabelle `bedrohungen`
--

INSERT INTO `bedrohungen` (`id`, `art`, `name`, `beschreibung`) VALUES
(1, 'Vorsätzliche menschliche Bedrohung', 'Cyberangriff (extern)', 'Gezielter Angriff auf IT-Systeme von außen'),
(2, 'Vorsätzliche menschliche Bedrohung', 'Malware/Ransomware', 'Schadsoftware zur Verschlüsselung, Zerstörung oder zum Diebstahl von Daten'),
(3, 'Vorsätzliche menschliche Bedrohung', 'Phishing/Social Engineering', 'Täuschung von Mitarbeitenden zur Erlangung von Zugangsdaten oder Informationen'),
(4, 'Vorsätzliche menschliche Bedrohung', 'Insiderangriff (vorsätzlich)', 'Missbrauch von Berechtigungen durch interne Personen'),
(5, 'Vorsätzliche menschliche Bedrohung', 'Datendiebstahl', 'Unbefugte Entwendung sensibler Informationen'),
(6, 'Vorsätzliche menschliche Bedrohung', 'Sabotage', 'Gezielte Manipulation oder Zerstörung von Systemen oder Daten'),
(7, 'Vorsätzliche menschliche Bedrohung', 'DDoS-Angriff', 'Überlastung von Diensten zur Herbeiführung eines Ausfalls'),
(8, 'Vorsätzliche menschliche Bedrohung', 'Industriespionage', 'Ausspähen von Geschäfts- oder Betriebsgeheimnissen'),
(9, 'Unbeabsichtigte menschliche Bedrohung', 'Fehlbedienung', 'Falsche Nutzung von IT-Systemen durch Anwender'),
(10, 'Unbeabsichtigte menschliche Bedrohung', 'Fehlkonfiguration', 'Unsachgemäße Konfiguration von Systemen oder Diensten'),
(11, 'Unbeabsichtigte menschliche Bedrohung', 'Unbeabsichtigtes Löschen von Daten', 'Verlust von Informationen durch Bedienfehler'),
(12, 'Unbeabsichtigte menschliche Bedrohung', 'Fehlversand von Informationen', 'Versand sensibler Daten an falsche Empfänger'),
(13, 'Unbeabsichtigte menschliche Bedrohung', 'Verlust von Endgeräten', 'Abhandenkommen von Laptops, Smartphones oder Datenträgern'),
(14, 'Unbeabsichtigte menschliche Bedrohung', 'Unzureichende Sensibilisierung', 'Fehlendes Sicherheitsbewusstsein bei Mitarbeitenden'),
(15, 'Technische Bedrohung', 'Hardwareausfall', 'Defekt oder Versagen von Hardwarekomponenten'),
(16, 'Technische Bedrohung', 'Softwarefehler', 'Fehlerhafte oder instabile Software'),
(17, 'Technische Bedrohung', 'Fehlgeschlagenes Update', 'Störung durch fehlerhafte Aktualisierungen'),
(18, 'Technische Bedrohung', 'Veraltete Systeme', 'Nicht mehr unterstützte Hard- oder Software'),
(19, 'Technische Bedrohung', 'Kapazitätsengpass', 'Überlastung von Systemen oder Diensten'),
(20, 'Technische Bedrohung', 'Datenkorruption', 'Beschädigung von Daten durch technische Fehler'),
(21, 'Technische Bedrohung', 'Ausfall von Backup/Recovery', 'Nicht funktionsfähige Sicherungs- oder Wiederherstellungsprozesse'),
(22, 'Organisatorische Bedrohung', 'Fehlende Prozesse', 'Nicht vorhandene oder unzureichende Regelungen'),
(23, 'Organisatorische Bedrohung', 'Unklare Verantwortlichkeiten', 'Rollen und Zuständigkeiten sind nicht definiert'),
(24, 'Organisatorische Bedrohung', 'Unzureichendes Berechtigungsmanagement', 'Zu weitgehende oder falsch vergebene Zugriffsrechte'),
(25, 'Organisatorische Bedrohung', 'Fehlendes Vier-Augen-Prinzip', 'Kritische Tätigkeiten ohne Kontrolle'),
(26, 'Organisatorische Bedrohung', 'Unzureichendes Change-Management', 'Unkontrollierte Änderungen an Systemen'),
(27, 'Organisatorische Bedrohung', 'Fehlende Notfallplanung', 'Kein oder unzureichender Notfall- und Wiederanlaufplan'),
(28, 'Organisatorische Bedrohung', 'Unzureichende Lieferantensteuerung', 'Sicherheitsanforderungen an Dienstleister fehlen oder werden nicht überwacht'),
(29, 'Physische Bedrohung', 'Brand', 'Feuer im Gebäude oder Serverraum'),
(30, 'Physische Bedrohung', 'Wasser/Leckage', 'Schäden durch Wasser oder Feuchtigkeit'),
(31, 'Physische Bedrohung', 'Stromausfall', 'Unterbrechung der Stromversorgung'),
(32, 'Physische Bedrohung', 'Klimaanlagenausfall', 'Überhitzung von IT-Systemen'),
(33, 'Physische Bedrohung', 'Diebstahl', 'Entwendung von Hardware oder Datenträgern'),
(34, 'Physische Bedrohung', 'Unbefugter Zutritt', 'Physischer Zugriff durch nicht autorisierte Personen'),
(35, 'Höhere Gewalt', 'Naturkatastrophe', 'Sturm, Hochwasser, Erdbeben oder ähnliche Ereignisse'),
(36, 'Höhere Gewalt', 'Pandemie', 'Großflächige Personalausfälle'),
(37, 'Höhere Gewalt', 'Krieg/politische Instabilität', 'Auswirkungen geopolitischer Ereignisse'),
(38, 'Höhere Gewalt', 'Ausfall kritischer Infrastruktur', 'Störungen bei Energie, Wasser oder Telekommunikation'),
(39, 'Höhere Gewalt', 'Lieferkettenstörung', 'Nichtverfügbarkeit von Produkten oder Dienstleistungen'),
(40, 'Rechtliche/Compliance-Bedrohung', 'Gesetzesverstoß', 'Nichteinhaltung gesetzlicher oder regulatorischer Anforderungen'),
(41, 'Rechtliche/Compliance-Bedrohung', 'Datenschutzverstoß', 'Verletzung von Datenschutzvorgaben'),
(42, 'Rechtliche/Compliance-Bedrohung', 'Vertragsverletzung', 'Nichtbeachtung vertraglicher Sicherheitsanforderungen'),
(43, 'Rechtliche/Compliance-Bedrohung', 'Sanktionen/Bußgelder', 'Finanzielle oder rechtliche Konsequenzen'),
(44, 'Rechtliche/Compliance-Bedrohung', 'Reputationsschaden', 'Imageverlust durch Sicherheits- oder Compliance-Vorfälle');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bedrohung_kategorie`
--

CREATE TABLE `bedrohung_kategorie` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Daten für Tabelle `bedrohung_kategorie`
--

INSERT INTO `bedrohung_kategorie` (`id`, `name`) VALUES
(1, 'Höhere Gewalt'),
(2, 'Organisatorische Bedrohung'),
(3, 'Physische Bedrohung'),
(4, 'Rechtliche/Compliance-Bedrohung'),
(5, 'Sonstiges'),
(6, 'Technische Bedrohung'),
(7, 'Umweltbedrohung'),
(8, 'Unbeabsichtigte menschliche Bedrohung'),
(9, 'Vorsätzliche menschliche Bedrohung');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bericht_art`
--

CREATE TABLE `bericht_art` (
  `id` int(10) UNSIGNED NOT NULL,
  `Bezeichnung` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `bericht_art`
--

INSERT INTO `bericht_art` (`id`, `Bezeichnung`) VALUES
(1, 'ISO/IEC 27001:2022'),
(2, 'Statement of Applicability (SoA)'),
(3, 'Management Summary'),
(4, 'Risikomanagement'),
(5, 'Lieferantenmanagement');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bpmn_dokumente`
--

CREATE TABLE `bpmn_dokumente` (
  `id` int(11) NOT NULL,
  `Nummer` varchar(50) NOT NULL DEFAULT '',
  `Titel` varchar(255) NOT NULL DEFAULT '',
  `bpmn_xml` longtext NOT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'Entwurf',
  `Ersteller` int(11) NOT NULL DEFAULT 0,
  `erstellt` date NOT NULL,
  `Änderer` int(11) NOT NULL DEFAULT 0,
  `geändert` date DEFAULT NULL,
  `Typ` varchar(100) NOT NULL DEFAULT 'BPMN'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cron_settings`
--

CREATE TABLE `cron_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `job_key` varchar(64) NOT NULL,
  `bezeichnung` varchar(128) NOT NULL,
  `uhrzeit` time NOT NULL,
  `intervall_tage` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `aktiv` tinyint(1) NOT NULL DEFAULT 1,
  `letzter_lauf` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `cron_settings`
--

INSERT INTO `cron_settings` (`id`, `job_key`, `bezeichnung`, `uhrzeit`, `intervall_tage`, `aktiv`, `letzter_lauf`) VALUES
(1, 'aufgaben_mailer', 'Aufgaben-Erinnerung (E-Mail)', '07:00:00', 7, 1, '2026-07-07'),
(2, 'risiko_historie', 'Risikoscore-Historie (Snapshot)', '06:55:00', 7, 1, '2026-07-20');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Dokumente`
--

CREATE TABLE `Dokumente` (
  `id` int(11) UNSIGNED NOT NULL,
  `Dokumentennummer` varchar(64) NOT NULL,
  `Dokumentenname` varchar(256) NOT NULL,
  `Typ` varchar(256) NOT NULL,
  `Status` varchar(64) NOT NULL,
  `Version` int(11) DEFAULT 0,
  `Klassifizierung` varchar(128) DEFAULT NULL,
  `Text` mediumtext NOT NULL,
  `Ersteller` int(11) DEFAULT 0,
  `Pruefer` int(11) DEFAULT 0,
  `Freigebener` int(11) DEFAULT 0,
  `erstellt` date NOT NULL DEFAULT current_timestamp(),
  `geprueft` date DEFAULT NULL,
  `freigegeben` date DEFAULT NULL,
  `review` date DEFAULT NULL,
  `Änderer` int(11) DEFAULT 0,
  `geändert` date DEFAULT NULL,
  `Subversion` int(11) NOT NULL DEFAULT 0,
  `archiviert` tinyint(1) NOT NULL DEFAULT 0,
  `schreibschutz` tinyint(1) NOT NULL DEFAULT 0,
  `gibtneueversion` tinyint(1) NOT NULL DEFAULT 0,
  `Reviewer` int(10) UNSIGNED DEFAULT NULL,
  `zupruefen` tinyint(1) NOT NULL DEFAULT 0,
  `Dokumentenname_en` varchar(255) DEFAULT NULL,
  `text_en` text DEFAULT NULL,
  `Typ_en` varchar(256) DEFAULT NULL,
  `Classification` varchar(128) DEFAULT NULL,
  `Status_en` varchar(64) DEFAULT NULL,
  `Besitzer` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bpmn` varchar(1024) DEFAULT NULL,
  `werpruefen` int(10) DEFAULT NULL,
  `werfreigeben` int(10) DEFAULT NULL,
  `freizugeben` tinyint(1) NOT NULL DEFAULT 0,
  `istfreigegeben` tinyint(1) NOT NULL DEFAULT 0,
  `dok_verknuepfung` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `Dokumente`
--

INSERT INTO `Dokumente` (`id`, `Dokumentennummer`, `Dokumentenname`, `Typ`, `Status`, `Version`, `Klassifizierung`, `Text`, `Ersteller`, `Pruefer`, `Freigebener`, `erstellt`, `geprueft`, `freigegeben`, `review`, `Änderer`, `geändert`, `Subversion`, `archiviert`, `schreibschutz`, `gibtneueversion`, `Reviewer`, `zupruefen`, `Dokumentenname_en`, `text_en`, `Typ_en`, `Classification`, `Status_en`, `Besitzer`, `bpmn`, `werpruefen`, `werfreigeben`, `freizugeben`, `istfreigegeben`, `dok_verknuepfung`) VALUES
(5, 'DOK-00001', 'Informationssicherheitsrichtlinie', 'Richtlinien', '6', 1, 'öffentlich', '<h2><strong>1. Zweck der Richtlinie</strong></h2>\n<p>Diese Informationssicherheitsrichtlinie legt die strategischen Grundsätze und Ziele zum Schutz der Informationen der Organisation fest. Ziel ist es, die <strong>Vertraulichkeit</strong>, <strong>Integrität</strong> und <strong>Verfügbarkeit</strong> aller informationsverarbeitenden Systeme, Prozesse und Daten sicherzustellen – unabhängig von Form, Medium oder Standort.</p>\n<p>Die Richtlinie dient als verbindliche Vorgabe der obersten Leitung und bildet die Grundlage für alle untergeordneten Sicherheitsrichtlinien, Verfahrensanweisungen und Maßnahmen des Informationssicherheitsmanagementsystems (ISMS).</p>\n\n<h2><strong>2. Geltungsbereich</strong></h2>\n<p>Die Richtlinie gilt für:</p>\n<ul>\n<li><p>Alle <strong>Informationen</strong>, IT-Systeme, Netz- und Informationssysteme sowie Kommunikationsmittel der Organisation</p></li>\n<li><p><strong>Alle Mitarbeiter*innen</strong>, Dienstleister, Auftragnehmer und externen Partner, die mit Informationen der Organisation umgehen oder Zugang zu Systemen haben</p></li>\n<li><p><strong>Alle Standorte</strong>, Tochterunternehmen und externen Betriebsstätten, sofern nicht abweichend geregelt</p></li>\n<li><p>Alle <strong>Lieferketten und Abhängigkeiten</strong> zu direkten Anbietern und Diensteanbietern</p></li>\n</ul>\n<p>Der Geltungsbereich wird im Rahmen des ISMS dokumentiert und mindestens jährlich auf Aktualität geprüft (vgl. ISO 27001:2022, Abschnitt 4.3).</p>\n\n<h2><strong>3. Informationssicherheitsziele</strong></h2>\n<p>Die Organisation verpflichtet sich, ein angemessenes Sicherheitsniveau zu gewährleisten durch:</p>\n<ul>\n<li><p>Schutz vertraulicher Informationen vor unbefugtem Zugriff (<strong>Vertraulichkeit</strong>)</p></li>\n<li><p>Sicherstellung der Korrektheit und Vollständigkeit von Informationen (<strong>Integrität</strong>)</p></li>\n<li><p>Sicherstellung der rechtzeitigen Verfügbarkeit von Informationen und IT-Systemen (<strong>Verfügbarkeit</strong>)</p></li>\n<li><p>Gewährleistung der <strong>Authentizität</strong> und <strong>Nachweisbarkeit</strong> von Informationen und Transaktionen</p></li>\n<li><p>Einhaltung gesetzlicher, vertraglicher und regulatorischer Anforderungen, insbesondere der <strong>NIS2-Richtlinie (EU) 2022/2555</strong></p></li>\n<li><p>Etablierung und kontinuierliche Verbesserung eines ISMS nach <strong>ISO/IEC 27001:2022</strong></p></li>\n<li><p>Sicherstellung der <strong>Resilienz</strong> kritischer Geschäftsprozesse und Systeme</p></li>\n</ul>\n<p>Die Informationssicherheitsziele werden messbar definiert, regelmäßig überwacht und im Rahmen der Managementbewertung evaluiert (vgl. ISO 27001:2022, Abschnitt 6.2).</p>\n\n<h2><strong>4. Grundsätze der Informationssicherheit</strong></h2>\n<ul>\n<li><p><strong>Informationssicherheit ist Führungsaufgabe</strong> und wird durch die oberste Leitung aktiv getragen und verantwortet (vgl. ISO 27001:2022, Abschnitt 5.1; NIS2 Art. 20).</p></li>\n<li><p><strong>Sicherheit betrifft alle</strong> – jede Person in der Organisation trägt Verantwortung für den Schutz von Informationen.</p></li>\n<li><p>Sicherheitsmaßnahmen basieren auf <strong>systematischen Risikoanalysen</strong> und <strong>Schutzbedarfsfeststellungen</strong> gemäß einem dokumentierten Risikomanagementprozess (vgl. ISO 27001:2022, Abschnitt 6.1; NIS2 Art. 21).</p></li>\n<li><p>Informationssicherheit wird im Rahmen des <strong>PDCA-Zyklus</strong> (Plan-Do-Check-Act) <strong>kontinuierlich überprüft, verbessert und angepasst</strong>.</p></li>\n<li><p>Es gilt das Prinzip des <strong>\"Need-to-know\"</strong> und <strong>\"Least Privilege\"</strong> – Zugriffe erfolgen nur bei berechtigtem Bedarf und mit minimalen erforderlichen Rechten.</p></li>\n<li><p>Der Schutz personenbezogener Daten wird gemäß der <strong>DSGVO</strong> sichergestellt.</p></li>\n<li><p>Ein <strong>risikobasierter Ansatz</strong> wird verfolgt, um Maßnahmen verhältnismäßig zum Schutzbedarf und zur Bedrohungslage zu gestalten.</p></li>\n</ul>\n\n<h2><strong>5. Rollen und Verantwortlichkeiten</strong></h2>\n<p>Die Verantwortlichkeiten für Informationssicherheit sind wie folgt festgelegt (vgl. ISO 27001:2022, Abschnitt 5.3; Anhang A.5.2, A.5.3, A.5.4):</p>\n\n<h3><strong>5.1 Geschäftsführung / Oberste Leitung</strong></h3>\n<ul>\n<li><p>Trägt die <strong>Gesamtverantwortung</strong> für Informationssicherheit und Cyberresilienz (vgl. NIS2 Art. 20)</p></li>\n<li><p>Genehmigt diese Richtlinie und stellt angemessene <strong>Ressourcen</strong> bereit</p></li>\n<li><p>Definiert strategische <strong>Zielvorgaben</strong> und überwacht deren Erreichung</p></li>\n<li><p>Nimmt an <strong>Schulungen</strong> zur Informationssicherheit teil (vgl. NIS2 Art. 20 Abs. 2)</p></li>\n<li><p>Trägt die Verantwortung für die <strong>Genehmigung von Risikomanagementmaßnahmen</strong> und deren Umsetzungsüberwachung</p></li>\n</ul>\n\n<h3><strong>5.2 Informationssicherheitsbeauftragte*r (ISB)</strong></h3>\n<ul>\n<li><p><strong>Steuerung und Koordination</strong> des ISMS</p></li>\n<li><p><strong>Beratung</strong> der Geschäftsführung und Fachbereiche in Sicherheitsfragen</p></li>\n<li><p><strong>Überwachung</strong> der Einhaltung von Sicherheitsrichtlinien</p></li>\n<li><p>Koordination von <strong>Risikoanalysen</strong> und <strong>Sicherheitsvorfällen</strong></p></li>\n<li><p><strong>Berichterstattung</strong> an die oberste Leitung</p></li>\n<li><p>Koordination der <strong>Meldepflichten</strong> gemäß NIS2 Art. 23</p></li>\n</ul>\n\n<h3><strong>5.3 IT-Leitung / IT-Sicherheit</strong></h3>\n<ul>\n<li><p><strong>Technische Umsetzung</strong> der Schutzmaßnahmen</p></li>\n<li><p>Betrieb sicherer IT-Infrastrukturen und <strong>Netz- und Informationssysteme</strong></p></li>\n<li><p>Implementierung von <strong>Sicherheitskontrollen</strong> gemäß Anhang A der ISO 27001:2022</p></li>\n<li><p><strong>Schwachstellenmanagement</strong> und <strong>Patch-Management</strong></p></li>\n</ul>\n\n<h3><strong>5.4 Datenschutzbeauftragte*r</strong></h3>\n<ul>\n<li><p>Sicherstellung der Einhaltung der <strong>DSGVO</strong> und des <strong>BDSG</strong></p></li>\n<li><p><strong>Zusammenarbeit</strong> mit dem ISB bei datenschutzrelevanten Sicherheitsthemen</p></li>\n</ul>\n\n<h3><strong>5.5 Fachbereichsleitungen</strong></h3>\n<ul>\n<li><p><strong>Umsetzung</strong> der Sicherheitsvorgaben in ihrem Verantwortungsbereich</p></li>\n<li><p><strong>Asset-Verantwortung</strong> für Informationswerte ihres Bereichs</p></li>\n<li><p>Sicherstellung der <strong>Schulung</strong> ihrer Mitarbeiter*innen</p></li>\n</ul>\n\n<h3><strong>5.6 Alle Mitarbeiter*innen</strong></h3>\n<ul>\n<li><p><strong>Einhaltung</strong> der Sicherheitsrichtlinien und Verfahrensanweisungen</p></li>\n<li><p><strong>Unverzügliches Melden</strong> von Sicherheitsvorfällen, Schwachstellen und verdächtigen Aktivitäten</p></li>\n<li><p>Teilnahme an <strong>Schulungen</strong> und Sensibilisierungsmaßnahmen</p></li>\n</ul>\n\n<h2><strong>6. Organisation der Informationssicherheit</strong></h2>\n<p>Die Organisation der Informationssicherheit erfolgt im Rahmen des ISMS (vgl. ISO 27001:2022, Anhang A.5.1 ff.):</p>\n<ul>\n<li><p>Informationssicherheit ist <strong>organisatorisch verankert</strong> und in die Geschäftsprozesse integriert.</p></li>\n<li><p>Sicherheitsrichtlinien, -verfahren und -prozesse werden <strong>dokumentiert, freigegeben und kommuniziert</strong>.</p></li>\n<li><p>Es finden <strong>regelmäßige Schulungen</strong> und <strong>Sensibilisierungsmaßnahmen</strong> für alle Mitarbeiter*innen statt (vgl. ISO 27001:2022, Anhang A.6.3).</p></li>\n<li><p>Verstöße gegen Richtlinien werden gemäß einem <strong>Disziplinarverfahren</strong> verfolgt und können arbeitsrechtliche Konsequenzen haben (vgl. ISO 27001:2022, Anhang A.6.4).</p></li>\n<li><p>Die <strong>Trennung von Aufgaben</strong> (Segregation of Duties) wird berücksichtigt, um Interessenkonflikte und Missbrauch zu verhindern (vgl. ISO 27001:2022, Anhang A.5.3).</p></li>\n<li><p>Der <strong>Kontakt zu Behörden</strong> und relevanten <strong>Interessengruppen</strong> wird gepflegt (vgl. ISO 27001:2022, Anhang A.5.5, A.5.6).</p></li>\n</ul>\n\n<h2><strong>7. Risikomanagement</strong></h2>\n<p>Die Organisation betreibt ein systematisches Risikomanagement für Informationssicherheit (vgl. ISO 27001:2022, Abschnitt 6.1; NIS2 Art. 21):</p>\n<ul>\n<li><p><strong>Risikoidentifikation</strong>: Systematische Erfassung von Bedrohungen und Schwachstellen für Informationswerte</p></li>\n<li><p><strong>Risikoanalyse</strong>: Bewertung von Eintrittswahrscheinlichkeit und potenziellen Auswirkungen</p></li>\n<li><p><strong>Risikobewertung</strong>: Priorisierung anhand definierter Risikoakzeptanzkriterien</p></li>\n<li><p><strong>Risikobehandlung</strong>: Auswahl geeigneter Maßnahmen (Vermeidung, Verminderung, Transfer, Akzeptanz)</p></li>\n<li><p>Erstellung und Pflege einer <strong>Erklärung zur Anwendbarkeit</strong> (Statement of Applicability)</p></li>\n<li><p>Regelmäßige <strong>Überprüfung und Aktualisierung</strong> der Risikoeinschätzungen</p></li>\n</ul>\n<p>Die Geschäftsführung genehmigt die Risikobehandlungspläne und akzeptiert verbleibende Restrisiken formal.</p>\n\n<h2><strong>8. Sicherheitsmaßnahmen</strong></h2>\n<p>Die Organisation setzt auf <strong>präventive, detektive und reaktive</strong> Maßnahmen entsprechend den Kontrollen des Anhang A der ISO 27001:2022 und den Anforderungen nach NIS2 Art. 21:</p>\n\n<h3><strong>8.1 Organisatorische Maßnahmen</strong></h3>\n<ul>\n<li><p><strong>Richtlinien für Informationssicherheit</strong> (A.5.1)</p></li>\n<li><p><strong>Informationssicherheit im Projektmanagement</strong> (A.5.8)</p></li>\n<li><p><strong>Klassifizierung und Kennzeichnung</strong> von Informationen (A.5.12, A.5.13)</p></li>\n<li><p><strong>Lieferantenmanagement</strong> und Sicherheit in der <strong>Lieferkette</strong> (A.5.19-A.5.23; NIS2 Art. 21 Abs. 2 lit. d)</p></li>\n</ul>\n\n<h3><strong>8.2 Personenbezogene Maßnahmen</strong></h3>\n<ul>\n<li><p><strong>Sicherheitsüberprüfungen</strong> vor Einstellung (A.6.1)</p></li>\n<li><p><strong>Schulung und Sensibilisierung</strong> (A.6.3)</p></li>\n<li><p><strong>Verantwortlichkeiten bei Beendigung</strong> des Arbeitsverhältnisses (A.6.5)</p></li>\n</ul>\n\n<h', 1, 1, 1, '2025-12-18', '2026-01-17', '2026-01-17', '2026-12-28', 1, '2026-04-19', 0, 0, 1, 0, 1, 1, 'Information Security Policy', '<h2><strong>1. Purpose of the Policy</strong></h2>\n<p>This Information Security Policy establishes the strategic principles and objectives for protecting the organization\'s information. The goal is to ensure the <strong>confidentiality</strong>, <strong>integrity</strong>, and <strong>availability</strong> of all information processing systems, processes, and data – regardless of form, medium, or location.</p>\n<hr/>\n<h2><strong>2. Scope</strong></h2>\n<p>This policy applies to:</p>\n<ul>\n<li>\n<p>All <strong>information</strong>, IT systems, and communication tools of the organization</p>\n</li>\n</ul>\n<p><strong>All employees, service providers, and external partners who handle information of the organization</strong></p>\n<p><strong>All locations, subsidiaries, and external operating sites, unless otherwise stipulated</strong></p>\n<p><strong><strong> </strong></strong></p>\n<hr/>\n<h2><strong>3. Information Security Objectives</strong></h2>\n<p>The organization is committed to ensuring an appropriate level of security by:</p>\n<ul>\n<li>\n<p>Protecting confidential information from unauthorized access (confidentiality)</p>\n</li>\n<li>\n<p>Ensuring the accuracy and completeness of information (integrity)</p>\n</li>\n<li>\n<p>Ensuring the timely availability of information and IT systems (availability)</p>\n</li>\n<li>\n<p>Compliance with legal, contractual, and regulatory requirements</p>\n</li>\n<li>\n<p>Establishing and continuously improving an ISMS according to ISO/IEC 27001</p>\n</li>\n</ul>\n<hr/>\n<h2><strong>4. Principles of Information Security</strong></h2>\n<ul>\n<li>\n<p><strong>Information security is a management responsibility and is supported by top management.</strong></p>\n<strong> </strong></li>\n</ul>\n<p><strong>Security concerns everyone</strong> – every person in the organization bears responsibility.</p>\n<p>Security measures are based on <strong>risk analyses</strong> and <strong>assessments of protection requirements</strong>.</p>\n<p>Information security is <strong>continuously reviewed, improved, and adapted</strong>.</p>\n<p>The principle of <strong>\"need-to-know\"</strong> applies – Access is granted only when legitimately required.</p>\n<p><strong>The protection of personal data is ensured in accordance with the <strong>GDPR</strong>.</strong></p>\n<hr/>\n<h2><strong>5. Roles and Responsibilities</strong></h2>\n<div class=\"TyagGW_tableContainer\">\n<div class=\"group TyagGW_tableWrapper flex w-fit flex-col-reverse\">\n<table class=\"w-fit min-w-(--thread-content-width)\">\n<thead>\n<tr>\n<th>Role</th>\n<th>Tasks</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td><strong>Management</strong></td>\n<td>Overall responsibility, resource allocation, target setting</td>\n</tr>\n<tr>\n<td><strong>Information Security Officer (ISO)</strong></td>\n<td>Steering the ISMS, consulting, Control</td>\n</tr>\n<tr>\n<td><strong>IT Management / IT Security</strong></td>\n<td>Technical implementation of security measures</td>\n</tr>\n<tr>\n<td><strong>Data Protection Officer</strong></td>\n<td>Ensuring compliance with the GDPR</td>\n</tr>\n<tr>\n<td><strong>Department Heads</strong></td>\n<td>Implementation of security guidelines in the line organization</td>\n</tr>\n<tr>\n<td><strong>All employees</strong></td>\n<td>Compliance with security guidelines and reporting of security incidents</td>\n</tr>\n</tbody>\n</table>\n</div>\n</div>\n<hr/>\n<h2><strong>6. Organization of Information Security</strong></h2>\n<ul>\n<li>\n<p>Information security is organizationally regulated within the framework of the ISMS.</p>\n</li>\n<li>\n<p>Security policies, procedures, and processes are documented and communicated.</p>\n</li>\n<li>\n<p>Regular training sessions and awareness-raising activities are held.</p>\n</li>\n<li>\n<p>Violations of policies are investigated and may result in disciplinary action.</p>\n</li>\n</ul>\n<hr/>\n<h2><strong>7. Security Measures </strong></h2>\n<p><strong>The organization relies on preventive, detective, and reactive measures: </strong></p>\n<ul>\n<li>Access Controls (physical and logical)</li>\n<li>Protection against malware and cyberattacks</li>\n<li>Patch and Change Management</li>\n<li>Data Backup and Recovery</li>\n<li>Disaster Management and Business</li>\n<li>Continuity Process-Integrated Risk Analyses</li>\n<li>Monitoring and Logging of Critical Systems</li>\n</ul>\n<hr/>\n<h2><strong>8. Handling Security Incidents</strong></h2>\n<p><strong>Security incidents must be reported <strong>immediately</strong> to the ISB or Service Desk.</strong></p>\n<ul>\n<li><strong> </strong>\n<p><strong>ItA defined incident management process exists. All incidents are documented, evaluated, and used for continuous improvement. 9. Compliance with legal requirements</strong></p>\n</li>\n</ul>\n<p>The organization is committed to complying with all relevant legal and regulatory requirements, in particular:</p>\n<ul>\n<li>\n<p><strong>GDPR / BDSG</strong></p>\n</li>\n<li>\n<p><strong>ISO/IEC 27001</strong></p>\n</li>\n<li>\n<p><strong>BSI IT Baseline Protection Compendium</strong></p>\n</li>\n<li>\n<p><strong>Contractual agreements with customers, suppliers, and partners</strong></p>\n</li>\n</ul>\n<hr/>\n<h2><strong>10. Communication and Training</strong></h2>\n<ul>\n<li>\n<p>The policy is actively communicated to <strong>all employees</strong>.</p>\n</li>\n<li>\n<p>Information security training takes place at least <strong>once a year</strong>.</p>\n</li>\n<li>\n<p>New employees receive an <strong>information security commitment</strong> as part of their onboarding.</p>\n</li>\n</ul>\n<hr/>\n<h2><strong>11. Control and Audit</strong></h2>\n<ul>\n<li>\n<p>The implementation of the policy is regularly reviewed through internal and, where necessary, external audits.</p>\n</li>\n</ul>\n<p>Compliance is monitored by the Information Security Officer (ISB), IT security managers, and specialist departments.</p>\n<p>Results are incorporated into the continuous improvement of the Information Security Management System (ISMS).</p>\n<hr/>\n<h2><strong>12. Continuous Improvement</strong></h2>\n<ul>\n<li>\n<p>Information security is understood as a <strong>living process</strong>.</p>\n</li>\n</ul>\n<p>Insights from incidents, audits, tests, and feedback are regularly incorporated into the further development of security measures.</p>\n<hr/>\n<h2><strong>13. Relation to norms and standards</strong></h2>\n<div class=\"TyagGW_tableContainer\">\n<div class=\"group TyagGW_tableWrapper flex w-fit flex-col-reverse\">\n<table class=\"w-fit min-w-(--thread-content-width)\">\n<thead>\n<tr>\n<th>Standard / Norm</th>\n<th>Relevant content</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td><strong>ISO/IEC 27001</strong></td>\n<td>A.5.1.1 - Information Security Guidelines</td>\n</tr>\n<tr>\n<td><strong>BSI IT Baseline Protection Compendium</strong></td>\n<td>ORP.1, ORP.3, ORP.4, ISMS.1.1</td>\n</tr>\n<tr>\n<td><strong>EU GDPR / BDSG</strong></td>\n<td>Protection of Personal Data</td>\n</tr>\n</tbody>\n</table>\n</div>\n</div>\n<hr/>\n<h2><strong>14. Entry into Force and Review</strong></h2>\n<p>This policy enters into force on <strong>[date]</strong>. It must be reviewed and, if necessary, adapted at least once a year or whenever there are relevant changes in the threat situation, infrastructure, or legal requirements.</p>', NULL, NULL, 'Released', 0, 'NULL,1', 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dok_anhaenge`
--

CREATE TABLE `dok_anhaenge` (
  `id` int(11) NOT NULL,
  `dok_id` int(11) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `stored_name` varchar(255) NOT NULL,
  `rel_path` varchar(255) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `file_size` int(11) NOT NULL,
  `beschreibung` varchar(255) DEFAULT NULL,
  `ersteller` int(11) DEFAULT NULL,
  `erstellt` date NOT NULL,
  `aenderer` int(11) DEFAULT NULL,
  `geaendert` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dok_historie`
--

CREATE TABLE `dok_historie` (
  `id` int(10) UNSIGNED NOT NULL,
  `dokument` int(11) NOT NULL,
  `kapitel` text DEFAULT NULL,
  `beschreibung` text DEFAULT NULL,
  `datum` date NOT NULL DEFAULT current_timestamp(),
  `version` int(11) NOT NULL,
  `subversion` int(11) NOT NULL,
  `user` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dok_status`
--

CREATE TABLE `dok_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(64) NOT NULL,
  `status_en` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `dok_status`
--

INSERT INTO `dok_status` (`id`, `status`, `status_en`) VALUES
(1, 'Entwurf', 'Draft'),
(2, 'in Bearbeitung', 'In Progress'),
(3, 'in Review', 'In Review'),
(4, 'in Prüfung', 'under Review'),
(5, 'in Freigabe', 'in release'),
(6, 'Freigegeben', 'Released'),
(7, 'zurückgezogen', 'withdrawn');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dok_typ`
--

CREATE TABLE `dok_typ` (
  `id` int(10) UNSIGNED NOT NULL,
  `typ` varchar(256) NOT NULL,
  `typ_en` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `dok_typ`
--

INSERT INTO `dok_typ` (`id`, `typ`, `typ_en`) VALUES
(1, 'Governance', 'Governance'),
(2, 'Richtlinien', 'Policies'),
(3, 'Verfahren', 'Procedures'),
(4, 'Statement of Applicability (SoA)', 'Statement of Applicability (SoA)'),
(5, 'Nachweisdokumente', 'Evidence documents');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dok_typ_en`
--

CREATE TABLE `dok_typ_en` (
  `id` int(10) UNSIGNED NOT NULL,
  `typ` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `dok_typ_en`
--

INSERT INTO `dok_typ_en` (`id`, `typ`) VALUES
(1, 'Governance'),
(2, 'Policies'),
(3, 'Procedures');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Gefaehrdungen`
--

CREATE TABLE `Gefaehrdungen` (
  `id` int(10) UNSIGNED NOT NULL,
  `Bezeichnung` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `Gefaehrdungen`
--

INSERT INTO `Gefaehrdungen` (`id`, `Bezeichnung`) VALUES
(1, 'G 0.1 Feuer'),
(2, 'G 0.2 Ungünstige klimatische Bedingungen'),
(3, 'G 0.3 Wasser'),
(4, 'G 0.4 Verschmutzung, Staub, Korrosion'),
(5, 'G 0.5 Naturkatastrophen'),
(6, 'G 0.6 Katastrophen im Umfeld'),
(7, 'G 0.7 Großereignisse im Umfeld'),
(8, 'G 0.8 Ausfall oder Störung der Stromversorgung'),
(9, 'G 0.9 Ausfall oder Störung von Kommunikationsnetzen'),
(10, 'G 0.10 Ausfall oder Störung von Versorgungsnetzen'),
(11, 'G 0.11 Ausfall oder Störung von Dienstleistern'),
(12, 'G 0.12 Elektromagnetische Störstrahlung'),
(13, 'G 0.13 Abfangen kompromittierender Strahlung'),
(14, 'G 0.14 Ausspähen von Informationen (Spionage) '),
(15, 'G 0.15 Abhören '),
(16, 'G 0.16 Diebstahl von Geräten, Datenträgern oder Dokumenten'),
(17, 'G 0.17 Verlust von Geräten, Datenträgern oder Dokumenten'),
(18, 'G 0.18 Fehlplanung oder fehlende Anpassung'),
(19, 'G 0.19 Offenlegung schützenswerter Informationen'),
(20, 'G 0.20 Informationen oder Produkte aus unzuverlässiger Quelle'),
(21, 'G 0.21 Manipulation von Hard- oder Software'),
(22, 'G 0.22 Manipulation von Informationen'),
(23, 'G 0.23 Unbefugtes Eindringen in IT-Systeme'),
(24, 'G 0.24 Zerstörung von Geräten oder Datenträgern'),
(25, 'G 0.25 Ausfall von Geräten oder Systemen'),
(26, 'G 0.26 Fehlfunktion von Geräten oder Systemen'),
(27, 'G 0.27 Ressourcenmangel '),
(28, 'G 0.28 Software-Schwachstellen oder -Fehler'),
(29, 'G 0.29 Verstoß gegen Gesetze oder Regelungen'),
(30, 'G 0.30 Unberechtigte Nutzung oder Administration von Geräten und Systemen'),
(31, 'G 0.31 Fehlerhafte Nutzung oder Administration von Geräten und Systemen'),
(32, 'G 0.32 Missbrauch von Berechtigungen'),
(33, 'G 0.33 Personalausfall'),
(34, 'G 0.34 Anschlag'),
(35, 'G 0.35 Nötigung, Erpressung oder Korruption'),
(36, 'G 0.36 Identitätsdiebstahl'),
(37, 'G 0.37 Abstreiten von Handlungen'),
(38, 'G 0.38 Missbrauch personenbezogener Daten'),
(39, 'G 0.39 Schadprogramme'),
(40, 'G 0.40 Verhinderung von Diensten (Denial of Service)'),
(41, 'G 0.41 Sabotage'),
(42, 'G 0.42 Social Engineering'),
(43, 'G 0.43 Einspielen von Nachrichten'),
(44, 'G 0.44 Unbefugtes Eindringen in Räumlichkeiten'),
(45, 'G 0.45 Datenverlust'),
(46, 'G 0.46 Integritätsverlust schützenswerter Informationen'),
(47, 'G 0.47 Schädliche Seiteneffekte IT-gestützter Angriffe');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Incidents`
--

CREATE TABLE `Incidents` (
  `id` int(10) UNSIGNED NOT NULL,
  `nummer` varchar(64) DEFAULT NULL,
  `Titel` varchar(256) DEFAULT NULL,
  `Beschreibung` text DEFAULT NULL,
  `Kategorie` varchar(64) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `Prio` varchar(64) DEFAULT NULL,
  `erkannt` date NOT NULL DEFAULT current_timestamp(),
  `gemeldet` date NOT NULL DEFAULT current_timestamp(),
  `beginn` date NOT NULL DEFAULT current_timestamp(),
  `beendet` date NOT NULL DEFAULT current_timestamp(),
  `geschlossen` date NOT NULL DEFAULT current_timestamp(),
  `Melder` int(10) UNSIGNED DEFAULT 0,
  `Owner` int(10) UNSIGNED DEFAULT 0,
  `Bearbeiter` int(10) UNSIGNED DEFAULT 0,
  `Eskalationsstelle` varchar(256) DEFAULT NULL,
  `typ` varchar(64) DEFAULT NULL,
  `ursache` varchar(64) DEFAULT NULL,
  `quelle` varchar(64) DEFAULT NULL,
  `Ersteller` int(10) UNSIGNED DEFAULT 0,
  `erstellt` date NOT NULL DEFAULT current_timestamp(),
  `DSGVO` tinyint(1) NOT NULL DEFAULT 0,
  `NIS2` tinyint(1) NOT NULL DEFAULT 0,
  `CRA` tinyint(1) NOT NULL DEFAULT 0,
  `Meldungwann` date NOT NULL DEFAULT current_timestamp(),
  `Meldungwem` varchar(256) DEFAULT NULL,
  `Rootcause` text DEFAULT NULL,
  `Schwachstelle` varchar(256) DEFAULT NULL,
  `Verbesserung` text DEFAULT NULL,
  `massnahmen` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `ticketnr` varchar(256) DEFAULT NULL,
  `Änderer` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `geändert` date NOT NULL DEFAULT current_timestamp(),
  `risiken` varchar(256) DEFAULT NULL,
  `assets` varchar(256) DEFAULT NULL,
  `archiviert` tinyint(1) NOT NULL DEFAULT 0,
  `vendor` varchar(256) DEFAULT NULL,
  `Titel_en` text DEFAULT NULL,
  `Beschreibung_en` text DEFAULT NULL,
  `Rootcause_en` text DEFAULT NULL,
  `Schwachstelle_en` text DEFAULT NULL,
  `Verbesserung_en` text DEFAULT NULL,
  `Ticketnummer` text DEFAULT NULL,
  `Massnahmentext` text DEFAULT NULL,
  `Massnahmentext_en` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `inc_link`
--

CREATE TABLE `inc_link` (
  `id` int(10) UNSIGNED NOT NULL,
  `incident_id` int(10) UNSIGNED NOT NULL,
  `link` varchar(512) NOT NULL,
  `bezeichnung` varchar(256) NOT NULL,
  `datum` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ismshilfe`
--

CREATE TABLE `ismshilfe` (
  `id` int(10) UNSIGNED NOT NULL,
  `seite` varchar(256) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `Text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ismshilfe`
--

INSERT INTO `ismshilfe` (`id`, `seite`, `name`, `Text`) VALUES
(10, 'lizenz_de', 'Lizenz', '<div class=\"lizenz-card\" style=\"background:#fff; border:1px solid #d0dde8; border-radius:10px; padding:20px 24px; max-width:820px; margin:0 0 16px; border-top:4px solid #2E5F8A; font-family:Arial, Helvetica, sans-serif; color:#333; line-height:1.55;\">\r\n\r\n  <h2 style=\"color:#2E5F8A; font-size:1.25rem; margin:0 0 4px;\">📄 Lizenzvereinbarung für WolfISMS (Subscription-Modell)</h2>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    1. Präambel\r\n  </div>\r\n  <p style=\"margin:0 0 10px;\">Diese Lizenzvereinbarung regelt die Nutzung der Software WolfISMS (nachfolgend „Software\") durch den Lizenznehmer.</p>\r\n  <p style=\"margin:0 0 10px;\">WolfISMS ist ein proprietäres Informationssicherheits-Management-System zur Unterstützung von Governance-, Risiko- und Compliance-Prozessen (u.&nbsp;a. ISO/IEC 27001, NIS2, BSI-Grundschutz).</p>\r\n  <p style=\"margin:0 0 18px;\">Die Software ist urheberrechtlich geschützt und wird nicht als Open-Source-Software bereitgestellt.</p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    2. Lizenzgeber\r\n  </div>\r\n  <p style=\"margin:0 0 4px;\">WolfInfoSec Wolfgang Schuster</p>\r\n  <p style=\"margin:0 0 4px;\">Inhaber: Wolfgang Schuster</p>\r\n  <p style=\"margin:0 0 4px;\">Deutschland</p>\r\n  <p style=\"margin:0 0 10px;\">(nachfolgend „Lizenzgeber\")</p>\r\n  <p style=\"margin:0 0 18px;\">\r\n    Die Software kann sowohl direkt vom Lizenzgeber als auch über einen vom Lizenzgeber autorisierten Vertriebspartner\r\n    (nachfolgend „Partner\") bezogen werden. Das Nutzungsrecht an der Software wird in beiden Fällen unmittelbar durch diese\r\n    Lizenzvereinbarung zwischen Lizenzgeber und Lizenznehmer begründet; die kommerzielle Abwicklung (Bestellung, Rechnungsstellung,\r\n    ggf. Hosting) kann hiervon unabhängig über den Partner erfolgen. Rechte und Pflichten zwischen Lizenzgeber und Partner richten\r\n    sich nach einem gesonderten Vertriebspartnervertrag.\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    3. Vertragsgegenstand\r\n  </div>\r\n  <p style=\"margin:0 0 18px;\">\r\n    Gegenstand dieser Vereinbarung ist die Überlassung von Nutzungsrechten an der Software WolfISMS im Rahmen eines zeitlich\r\n    befristeten Abonnements (Subscription), einschließlich zugehöriger Module, Datenbankstrukturen, Benutzeroberflächen sowie\r\n    der zur Nutzung erforderlichen Dokumentation.\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    4. Art der Lizenz\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Der Lizenzgeber räumt dem Lizenznehmer eine:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>nicht ausschließliche</li>\r\n    <li>nicht übertragbare</li>\r\n    <li>nicht unterlizenzierbare</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 6px;\">Lizenz zur Nutzung der Software ein.</p>\r\n  <p style=\"margin:0 0 18px;\">Die Lizenz gilt ausschließlich für den internen Einsatz im Unternehmen des Lizenznehmers und nur im Rahmen einer gültigen Subscription.</p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    5. Umfang der Nutzung\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Sofern nicht ausdrücklich schriftlich anders vereinbart, ist der Lizenznehmer berechtigt:</p>\r\n  <ul style=\"margin:0 0 12px; padding-left:20px;\">\r\n    <li>die Software intern zu betreiben (On-Premise oder Hosting nach Vereinbarung),</li>\r\n    <li>die Software für eigene ISMS-, GRC- und Compliance-Zwecke zu nutzen,</li>\r\n    <li>interne Benutzerkonten im Rahmen der gebuchten Lizenzparameter (z.&nbsp;B. Edition, Benutzeranzahl) anzulegen,</li>\r\n    <li>die Software durch einen vom Lizenzgeber autorisierten Partner betreiben bzw. hosten zu lassen (autorisiertes Hosting).</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 6px;\">Nicht gestattet ist insbesondere:</p>\r\n  <ul style=\"margin:0 0 12px; padding-left:20px;\">\r\n    <li>die entgeltliche oder unentgeltliche Weitergabe an Dritte, die nicht vom Lizenzgeber als Partner autorisiert sind,</li>\r\n    <li>der Betrieb als SaaS-, Cloud- oder Mandantenlösung für externe Organisationen durch den Lizenznehmer selbst oder durch nicht autorisierte Dritte,</li>\r\n    <li>das Anbieten der Software oder von Teilen davon als eigenes Produkt oder als eigene Dienstleistung durch den Lizenznehmer oder nicht autorisierte Dritte.</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 18px;\">\r\n    Ein „autorisierter Partner\" im Sinne dieser Vereinbarung ist ausschließlich ein Vertriebspartner, mit dem der Lizenzgeber\r\n    einen gültigen Vertriebspartnervertrag geschlossen hat, der ihn zum Vertrieb und/oder Hosting der Software berechtigt.\r\n    Erfolgt das Hosting durch einen autorisierten Partner oder den Lizenzgeber und werden dabei personenbezogene Daten des\r\n    Lizenznehmers verarbeitet, ist zwischen dem Lizenznehmer und der hostenden Stelle vor Aufnahme der Verarbeitung ein\r\n    Auftragsverarbeitungsvertrag gemäß Art. 28 DSGVO abzuschließen. Ohne einen solchen Auftragsverarbeitungsvertrag darf keine\r\n    Verarbeitung personenbezogener Daten im Rahmen des Hostings erfolgen.\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    6. Subscription, Vergütung und Zahlungsbedingungen\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Die Nutzung der Software ist kostenpflichtig und erfolgt ausschließlich im Rahmen einer Subscription.</p>\r\n  <p style=\"margin:0 0 6px;\">Art, Umfang, Laufzeit und Höhe der Vergütung ergeben sich aus:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>einem separaten Lizenz- oder Subscription-Vertrag,</li>\r\n    <li>einem Angebot oder</li>\r\n    <li>einer gültigen Preisliste des Lizenzgebers.</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 6px;\">Die Subscription ist im Voraus für den jeweiligen Abrechnungszeitraum zu bezahlen.</p>\r\n  <p style=\"margin:0 0 18px;\">Ohne gültige Subscription und vollständigen Zahlungseingang besteht kein Anspruch auf Updates oder Support.</p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    7. Updates und Weiterentwicklung\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Während einer aktiven Subscription erhält der Lizenznehmer Zugriff auf:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>Fehlerbehebungen (Bugfixes),</li>\r\n    <li>kleinere Verbesserungen und Weiterentwicklungen,</li>\r\n    <li>neue Versionen der Software im Rahmen der gebuchten Edition.</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 6px;\">Ein Anspruch auf bestimmte Funktionen, Erweiterungen oder individuelle Weiterentwicklungen besteht nicht.</p>\r\n  <p style=\"margin:0 0 18px;\">Nach Beendigung der Subscription werden keine Updates mehr bereitgestellt.</p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    8. Supportleistungen\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Supportleistungen werden ausschließlich während einer aktiven Subscription erbracht.</p>\r\n  <p style=\"margin:0 0 6px;\">Der Support umfasst ausschließlich:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>Unterstützung bei der Bedienung der Software,</li>\r\n    <li>Unterstützung bei der Installation und technischen Einrichtung.</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 6px;\">Der Support umfasst nicht:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>Beratung zur Informationssicherheit im Allgemeinen,</li>\r\n    <li>Interpretation oder Umsetzung von Normen (z.&nbsp;B. ISO/IEC 27001, NIS2, BSI-Grundschutz),</li>\r\n    <li>fachliche oder organisatorische ISMS-Beratung.</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 18px;\">Weitergehende Support- oder Beratungsleistungen bedürfen einer gesonderten Vereinbarung.</p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    9. Betrieb nach Ende der Subscription\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Nach Beendigung der Subscription ist der Lizenznehmer berechtigt, die zuletzt bereitgestellte Version der Software ohne Updates und ohne Support weiter zu betreiben.</p>\r\n  <p style=\"margin:0 0 6px;\">Der Weiterbetrieb erfolgt:</p>\r\n  <ul style=\"margin:0 0 18px; padding-left:20px;\">\r\n    <li>auf eigene Verantwortung des Lizenznehmers,</li>\r\n    <li>ohne Anspruch auf Fehlerbehebungen, Sicherheitsupdates oder Weiterentwicklungen,</li>\r\n    <li>ohne jegliche Haftung des Lizenzgebers für daraus resultierende Schäden.</li>\r\n  </ul>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    10. Urheber- und Schutzrechte\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Alle Rechte an der Software, insbesondere an:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>Quellcode und Objektcode,</li>\r\n    <li>Datenbankdesign und Strukturen,</li>\r\n    <li>Benutzeroberflächen,</li>\r\n    <li>Konzepten, Methoden und Logiken,</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 6px;\">verbleiben ausschließlich beim Lizenzgeber.</p>\r\n  <p style=\"margin:0 0 18px;\">Der Lizenznehmer erwirbt kein Eigentum an der Software, sondern lediglich ein Nutzungsrecht im vereinbarten Umfang.</p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    11. Verbotene Handlungen\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Dem Lizenznehmer ist es untersagt:</p>\r\n  <ul style=\"margin:0 0 18px; padding-left:20px;\">\r\n    <li>die Software zu dekompilieren, zu disassemblieren oder zurückzuentwickeln (Reverse Engineering),</li>\r\n    <li>Quellcode ganz oder teilweise zu verändern oder offenzulegen,</li>\r\n    <li>Lizenz-, Copyright- oder Schutzvermerke zu entfernen,</li>\r\n    <li>Sicherheits- oder Lizenzmechanismen zu umgehen.</li>\r\n  </ul>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    12. Anpassungen und Erweiterungen\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Individuelle Anpassungen, Erweiterungen oder Integrationen:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>bedürfen der Zustimmung des Lizenzgebers,</li>\r\n    <li>können gesondert vergütet werden,</li>\r\n    <li>begründen keine Miturheberschaft des Lizenznehmers.</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 18px;\">Sofern nichts anderes vereinbart ist, verbleiben alle daraus entstehenden Rechte beim Lizenzgeber.</p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    13. Gewährleistung\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Die Software wird in dem Zustand bereitgestellt, der dem aktuellen Entwicklungsstand entspricht („as is\").</p>\r\n  <p style=\"margin:0 0 6px;\">Der Lizenzgeber übernimmt insbesondere keine Gewähr dafür, dass:</p>\r\n  <ul style=\"margin:0 0 18px; padding-left:20px;\">\r\n    <li>die Software fehlerfrei ist,</li>\r\n    <li>sie jederzeit verfügbar ist,</li>\r\n    <li>sie allen individuellen rechtlichen oder organisatorischen Anforderungen des Lizenznehmers entspricht.</li>\r\n  </ul>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    14. Haftung\r\n  </div>\r\n  <p style=\"margin:0 0 10px;\">\r\n    Der Lizenzgeber haftet unbeschränkt bei Vorsatz und grober Fahrlässigkeit sowie nach den Vorschriften des\r\n    Produkthaftungsgesetzes. Ebenso unbeschränkt haftet der Lizenzgeber bei der Verletzung des Lebens, des Körpers oder der\r\n    Gesundheit, unabhängig vom Grad des Verschuldens.\r\n  </p>\r\n  <p style=\"margin:0 0 10px;\">\r\n    Bei leicht fahrlässiger Verletzung wesentlicher Vertragspflichten (Kardinalpflichten), deren Erfüllung die ordnungsgemäße\r\n    Durchführung des Vertrags überhaupt erst ermöglicht und auf deren Einhaltung der Lizenznehmer regelmäßig vertrauen darf,\r\n    ist die Haftung des Lizenzgebers der Höhe nach auf den bei Vertragsschluss vorhersehbaren, vertragstypischen Schaden begrenzt.\r\n  </p>\r\n  <p style=\"margin:0 0 10px;\">\r\n    Im Übrigen ist eine Haftung des Lizenzgebers für leichte Fahrlässigkeit ausgeschlossen, insbesondere für mittelbare Schäden,\r\n    entgangenen Gewinn und Datenverlust, soweit gesetzlich zulässig.\r\n  </p>\r\n  <p style=\"margin:0 0 18px;\">\r\n    Für Schäden, die im Rahmen eines von einem autorisierten Partner erbrachten Hostings entstehen, haftet der Lizenzgeber nicht,\r\n    soweit die Ursache im Verantwortungsbereich des Partners liegt; insoweit haftet der Partner gemäß dem zwischen ihm und dem\r\n    Lizenznehmer bestehenden Vertragsverhältnis.\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    15. Vertraulichkeit\r\n  </div>\r\n  <p style=\"margin:0 0 18px;\">\r\n    Der Lizenznehmer verpflichtet sich, alle ihm im Zusammenhang mit der Software bekannt gewordenen nicht-öffentlichen\r\n    Informationen vertraulich zu behandeln.\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    16. Anwendbares Recht und Gerichtsstand\r\n  </div>\r\n  <p style=\"margin:0 0 10px;\">Es gilt das Recht der Bundesrepublik Deutschland unter Ausschluss des UN-Kaufrechts (CISG).</p>\r\n  <p style=\"margin:0 0 18px;\">\r\n    Ist der Lizenznehmer Kaufmann im Sinne des Handelsgesetzbuchs, juristische Person des öffentlichen Rechts oder\r\n    öffentlich-rechtliches Sondervermögen, ist Gerichtsstand für alle Streitigkeiten aus oder im Zusammenhang mit dieser\r\n    Vereinbarung der Sitz des Lizenzgebers. Gegenüber Verbrauchern gelten die gesetzlichen Gerichtsstandsregelungen.\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    17. Schlussbestimmungen\r\n  </div>\r\n  <p style=\"margin:0 0 10px;\">Änderungen und Ergänzungen dieser Vereinbarung bedürfen der Textform. Dies gilt auch für einen Verzicht auf dieses Formerfordernis.</p>\r\n  <p style=\"margin:0 0 18px;\">Sollten einzelne Bestimmungen dieser Vereinbarung unwirksam sein oder werden, bleibt die Wirksamkeit der übrigen Regelungen unberührt.</p>\r\n\r\n  <p style=\"font-size:0.8rem; color:#888; margin:10px 0 0; border-top:1px solid #e0e8f0; padding-top:8px; font-style:italic;\">\r\n    © WolfInfoSec Wolfgang Schuster – Alle Rechte vorbehalten\r\n  </p>\r\n\r\n</div>'),
(11, 'isms_de', 'Was ist ein ISMS?', '<div class=\"isms-intro-card\" style=\"background:#fff; border:1px solid #d0dde8; border-radius:10px; padding:20px 24px; max-width:820px; margin:0 0 16px; border-top:4px solid #2E5F8A; font-family:Arial, Helvetica, sans-serif; color:#333; line-height:1.55;\">\r\n\r\n  <h2 style=\"color:#2E5F8A; font-size:1.25rem; margin:0 0 4px;\">🛡️ Informationssicherheits-Managementsystem (ISMS) – Allgemeine Einführung</h2>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    Was ist ein ISMS?\r\n  </div>\r\n  <p style=\"margin:0 0 10px;\">\r\n    Ein Informationssicherheits-Managementsystem (ISMS) ist ein <strong>systematischer, strukturierter Ansatz</strong>,\r\n    um Informationen und informationsverarbeitende Systeme <strong>angemessen zu schützen</strong>.<br>\r\n    Ziel ist es, Risiken für Informationen <strong>kontinuierlich zu erkennen, zu bewerten und zu steuern</strong>.\r\n  </p>\r\n  <p style=\"margin:0 0 18px;\">\r\n    Ein ISMS betrachtet Informationssicherheit <strong>ganzheitlich</strong> – nicht nur technisch, sondern auch organisatorisch und personell.\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    Ziele eines ISMS\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Ein wirksames ISMS verfolgt insbesondere folgende Ziele:</p>\r\n  <ul style=\"margin:0 0 18px; padding-left:20px;\">\r\n    <li>Schutz von Informationen und IT-Systemen</li>\r\n    <li>Sicherstellung von\r\n      <ul style=\"margin:6px 0 0; padding-left:20px;\">\r\n        <li><strong>Vertraulichkeit</strong> (Zugriff nur für Berechtigte)</li>\r\n        <li><strong>Integrität</strong> (Richtigkeit und Vollständigkeit)</li>\r\n        <li><strong>Verfügbarkeit</strong> (rechtzeitige Nutzbarkeit)</li>\r\n      </ul>\r\n    </li>\r\n    <li>Einhaltung gesetzlicher, regulatorischer und vertraglicher Anforderungen</li>\r\n    <li>Reduzierung von Sicherheitsvorfällen und Schäden</li>\r\n    <li>Transparenz und Nachweisbarkeit gegenüber Management, Kunden und Prüfern</li>\r\n  </ul>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    Warum ein ISMS notwendig ist\r\n  </div>\r\n  <p style=\"margin:0 0 10px;\">\r\n    Informationssicherheit ist heute ein <strong>kritischer Erfolgsfaktor</strong>.<br>\r\n    Organisationen stehen u.&nbsp;a. vor folgenden Herausforderungen:\r\n  </p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>Zunehmende Cyberbedrohungen</li>\r\n    <li>Steigende regulatorische Anforderungen</li>\r\n    <li>Komplexe IT- und Lieferketten</li>\r\n    <li>Abhängigkeit von digitalen Prozessen</li>\r\n    <li>Hohe Anforderungen an Nachweis und Compliance</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 18px;\">\r\n    Ein ISMS sorgt dafür, dass Informationssicherheit <strong>nicht zufällig</strong>, sondern\r\n    <strong>geplant, gesteuert und überprüft</strong> erfolgt.\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    Grundprinzipien eines ISMS\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Ein ISMS basiert auf klaren Prinzipien:</p>\r\n  <ul style=\"margin:0 0 18px; padding-left:20px;\">\r\n    <li><strong>Risikoorientierung</strong><br>Sicherheitsmaßnahmen werden dort umgesetzt, wo sie notwendig sind</li>\r\n    <li style=\"margin-top:8px;\"><strong>Verantwortlichkeit</strong><br>Rollen und Zuständigkeiten sind eindeutig definiert</li>\r\n    <li style=\"margin-top:8px;\"><strong>Dokumentation &amp; Nachweisbarkeit</strong><br>Entscheidungen und Umsetzungen sind nachvollziehbar dokumentiert</li>\r\n    <li style=\"margin-top:8px;\"><strong>Kontinuierliche Verbesserung</strong><br>Informationssicherheit entwickelt sich laufend weiter</li>\r\n  </ul>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    Der ISMS-Regelkreis (PDCA)\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Ein ISMS folgt einem kontinuierlichen Verbesserungsprozess, häufig dargestellt als PDCA-Zyklus:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li><strong>Plan</strong><br>Ziele festlegen, Risiken analysieren, Maßnahmen planen</li>\r\n    <li style=\"margin-top:8px;\"><strong>Do</strong><br>Maßnahmen umsetzen, Prozesse etablieren</li>\r\n    <li style=\"margin-top:8px;\"><strong>Check</strong><br>Wirksamkeit prüfen, Audits durchführen, Kennzahlen bewerten</li>\r\n    <li style=\"margin-top:8px;\"><strong>Act</strong><br>Verbesserungen ableiten, Anpassungen vornehmen</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 18px;\">Dieser Zyklus stellt sicher, dass das ISMS <strong>lebendig und aktuell</strong> bleibt.</p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    Zentrale Bausteine eines ISMS\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Ein ISMS besteht aus mehreren miteinander verknüpften Bereichen:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li><strong>Dokumente &amp; Richtlinien</strong> – Vorgaben und Regelwerke</li>\r\n    <li><strong>Assets</strong> – schützenswerte Werte der Organisation</li>\r\n    <li><strong>Risiken</strong> – Bedrohungen und Schwachstellen</li>\r\n    <li><strong>Maßnahmen</strong> – konkrete Schutz- und Verbesserungsmaßnahmen</li>\r\n    <li><strong>Lieferantenmanagement</strong> – Steuerung externer Risiken</li>\r\n    <li><strong>Personalmanagement</strong> – Rollen, Schulung und Sensibilisierung</li>\r\n    <li><strong>Termine</strong> – Fristen, Reviews und wiederkehrende Aufgaben</li>\r\n    <li><strong>Audits</strong> – Überprüfung und Verbesserung</li>\r\n    <li><strong>Normen</strong> – externe und interne Anforderungen</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 18px;\">Diese Bausteine greifen ineinander und bilden gemeinsam das ISMS.</p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    Rollen und Verantwortung im ISMS\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Ein ISMS ist eine <strong>Gemeinschaftsaufgabe</strong>. Typische Rollen sind:</p>\r\n  <ul style=\"margin:0 0 18px; padding-left:20px;\">\r\n    <li><strong>Management</strong><br>Verantwortung, Zielvorgaben, Freigaben</li>\r\n    <li style=\"margin-top:8px;\"><strong>Informationssicherheitsbeauftragte (ISB / CISO)</strong><br>Steuerung, Koordination und Weiterentwicklung des ISMS</li>\r\n    <li style=\"margin-top:8px;\"><strong>Fach- und IT-Verantwortliche</strong><br>Umsetzung von Maßnahmen in ihren Bereichen</li>\r\n    <li style=\"margin-top:8px;\"><strong>Mitarbeitende</strong><br>Einhaltung der Sicherheitsvorgaben im Arbeitsalltag</li>\r\n  </ul>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    ISMS als Teil der Organisation\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Ein ISMS ist <strong>kein isoliertes IT-Projekt</strong>, sondern:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>Teil der Unternehmensführung</li>\r\n    <li>Unterstützt Geschäftsziele</li>\r\n    <li>Integriert sich in bestehende Prozesse</li>\r\n    <li>Wächst mit der Organisation mit</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 6px;\">Ein gut eingeführtes ISMS erhöht nicht nur die Sicherheit, sondern auch:</p>\r\n  <ul style=\"margin:0 0 18px; padding-left:20px;\">\r\n    <li>Stabilität,</li>\r\n    <li>Vertrauen,</li>\r\n    <li>Professionalität.</li>\r\n  </ul>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    Rolle dieses ISMS-Portals\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Dieses ISMS-Portal dient als <strong>zentrale Plattform</strong> zur:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>Dokumentation aller ISMS-Elemente</li>\r\n    <li>Steuerung von Risiken und Maßnahmen</li>\r\n    <li>Erfüllung von Norm- und Audit-Anforderungen</li>\r\n    <li>Transparenz für Management und Mitarbeitende</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 18px;\">\r\n    Die Hilfeseiten unterstützen dabei, das ISMS <strong>verständlich, einheitlich und effizient</strong> zu nutzen.\r\n  </p>\r\n\r\n  <div style=\"background:#f0f4ff; border:1px solid #c7d4f5; border-left:4px solid #0078d4; border-radius:8px; padding:12px 16px; margin:0 0 4px;\">\r\n    <strong style=\"color:#0078d4;\">Empfohlene nächste Schritte für neue Nutzer:</strong>\r\n    <ol style=\"margin:8px 0 0; padding-left:20px; font-size:0.9rem; color:#333;\">\r\n      <li>Überblick über Dokumente und Richtlinien verschaffen</li>\r\n      <li>Relevante Assets prüfen oder erfassen</li>\r\n      <li>Risiken verstehen und bewerten</li>\r\n      <li>Maßnahmen und Termine verfolgen</li>\r\n      <li>Eigene Rolle im ISMS kennen</li>\r\n    </ol>\r\n  </div>\r\n\r\n</div>'),
(17, 'lizenz_en', 'License', '<div class=\"license-card\" style=\"background:#fff; border:1px solid #d0dde8; border-radius:10px; padding:20px 24px; max-width:820px; margin:0 0 16px; border-top:4px solid #2E5F8A; font-family:Arial, Helvetica, sans-serif; color:#333; line-height:1.55;\">\r\n\r\n  <h2 style=\"color:#2E5F8A; font-size:1.25rem; margin:0 0 4px;\">📄 License Agreement for WolfISMS (Subscription Model)</h2>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    1. Preamble\r\n  </div>\r\n  <p style=\"margin:0 0 10px;\">This license agreement governs the use of the WolfISMS software (hereinafter the \"Software\") by the licensee.</p>\r\n  <p style=\"margin:0 0 10px;\">WolfISMS is a proprietary information security management system supporting governance, risk, and compliance processes (including ISO/IEC 27001, NIS2, BSI IT-Grundschutz).</p>\r\n  <p style=\"margin:0 0 18px;\">The Software is protected by copyright and is not provided as open-source software.</p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    2. Licensor\r\n  </div>\r\n  <p style=\"margin:0 0 4px;\">WolfInfoSec Wolfgang Schuster</p>\r\n  <p style=\"margin:0 0 4px;\">Owner: Wolfgang Schuster</p>\r\n  <p style=\"margin:0 0 4px;\">Germany</p>\r\n  <p style=\"margin:0 0 10px;\">(hereinafter the \"Licensor\")</p>\r\n  <p style=\"margin:0 0 18px;\">\r\n    The Software may be obtained either directly from the Licensor or through a distribution partner authorized by the Licensor\r\n    (hereinafter the \"Partner\"). In either case, the right to use the Software is established directly through this license\r\n    agreement between the Licensor and the Licensee; the commercial handling (ordering, invoicing, and, where applicable, hosting)\r\n    may be carried out independently through the Partner. The rights and obligations between the Licensor and the Partner are\r\n    governed by a separate distribution partner agreement.\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    3. Subject Matter of the Agreement\r\n  </div>\r\n  <p style=\"margin:0 0 18px;\">\r\n    The subject matter of this agreement is the granting of usage rights to the WolfISMS software as part of a fixed-term\r\n    subscription, including associated modules, database structures, user interfaces, and the documentation required for use.\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    4. Type of License\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">The Licensor grants the Licensee a:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>non-exclusive</li>\r\n    <li>non-transferable</li>\r\n    <li>non-sublicensable</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 6px;\">license to use the Software.</p>\r\n  <p style=\"margin:0 0 18px;\">The license applies exclusively to internal use within the Licensee\'s organization and only for the duration of a valid subscription.</p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    5. Scope of Use\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Unless expressly agreed otherwise in writing, the Licensee is entitled to:</p>\r\n  <ul style=\"margin:0 0 12px; padding-left:20px;\">\r\n    <li>operate the Software internally (on-premise or hosted, as agreed),</li>\r\n    <li>use the Software for its own ISMS, GRC, and compliance purposes,</li>\r\n    <li>create internal user accounts within the scope of the licensed parameters (e.g., edition, number of users),</li>\r\n    <li>have the Software operated or hosted by a Partner authorized by the Licensor (authorized hosting).</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 6px;\">In particular, the following is not permitted:</p>\r\n  <ul style=\"margin:0 0 12px; padding-left:20px;\">\r\n    <li>passing the Software on, whether for payment or free of charge, to third parties not authorized by the Licensor as a Partner,</li>\r\n    <li>operating the Software as a SaaS, cloud, or multi-tenant solution for external organizations, whether by the Licensee itself or by unauthorized third parties,</li>\r\n    <li>offering the Software, or parts thereof, as the Licensee\'s own product or service, or that of an unauthorized third party.</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 18px;\">\r\n    An \"authorized Partner\" within the meaning of this agreement is exclusively a distribution partner with whom the Licensor\r\n    has entered into a valid distribution partner agreement entitling it to distribute and/or host the Software. Where hosting\r\n    is provided by an authorized Partner or by the Licensor and personal data of the Licensee is processed in this context, a\r\n    data processing agreement pursuant to Art. 28 GDPR must be concluded between the Licensee and the hosting party before\r\n    processing begins. No processing of personal data may take place as part of the hosting without such a data processing\r\n    agreement in place.\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    6. Subscription, Fees, and Payment Terms\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Use of the Software is subject to a fee and is provided exclusively under a subscription.</p>\r\n  <p style=\"margin:0 0 6px;\">The type, scope, term, and amount of the fee result from:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>a separate license or subscription agreement,</li>\r\n    <li>a quotation, or</li>\r\n    <li>a valid price list of the Licensor.</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 6px;\">The subscription must be paid in advance for the respective billing period.</p>\r\n  <p style=\"margin:0 0 18px;\">Without a valid subscription and full receipt of payment, there is no entitlement to updates or support.</p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    7. Updates and Further Development\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">During an active subscription, the Licensee receives access to:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>bug fixes,</li>\r\n    <li>minor improvements and enhancements,</li>\r\n    <li>new versions of the Software within the scope of the licensed edition.</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 6px;\">There is no entitlement to specific features, extensions, or individual further development.</p>\r\n  <p style=\"margin:0 0 18px;\">No further updates will be provided after the subscription ends.</p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    8. Support Services\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Support services are provided exclusively during an active subscription.</p>\r\n  <p style=\"margin:0 0 6px;\">Support covers exclusively:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>assistance with operating the Software,</li>\r\n    <li>assistance with installation and technical setup.</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 6px;\">Support does not cover:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>general information security consulting,</li>\r\n    <li>interpretation or implementation of standards (e.g., ISO/IEC 27001, NIS2, BSI IT-Grundschutz),</li>\r\n    <li>substantive or organizational ISMS consulting.</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 18px;\">Any further support or consulting services require a separate agreement.</p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    9. Operation After the End of the Subscription\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">After the subscription ends, the Licensee is entitled to continue operating the last version of the Software provided, without updates and without support.</p>\r\n  <p style=\"margin:0 0 6px;\">Continued operation takes place:</p>\r\n  <ul style=\"margin:0 0 18px; padding-left:20px;\">\r\n    <li>at the Licensee\'s own responsibility,</li>\r\n    <li>without any entitlement to bug fixes, security updates, or further development,</li>\r\n    <li>without any liability of the Licensor for resulting damages.</li>\r\n  </ul>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    10. Copyright and Intellectual Property Rights\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">All rights to the Software, in particular to:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>source code and object code,</li>\r\n    <li>database design and structures,</li>\r\n    <li>user interfaces,</li>\r\n    <li>concepts, methods, and logic,</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 6px;\">remain exclusively with the Licensor.</p>\r\n  <p style=\"margin:0 0 18px;\">The Licensee does not acquire ownership of the Software, but only a right of use within the agreed scope.</p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    11. Prohibited Actions\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">The Licensee is prohibited from:</p>\r\n  <ul style=\"margin:0 0 18px; padding-left:20px;\">\r\n    <li>decompiling, disassembling, or reverse engineering the Software,</li>\r\n    <li>modifying or disclosing the source code, in whole or in part,</li>\r\n    <li>removing license, copyright, or other protective notices,</li>\r\n    <li>circumventing security or licensing mechanisms.</li>\r\n  </ul>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    12. Customizations and Extensions\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">Individual customizations, extensions, or integrations:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>require the Licensor\'s consent,</li>\r\n    <li>may be subject to separate fees,</li>\r\n    <li>do not establish any co-authorship rights for the Licensee.</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 18px;\">Unless otherwise agreed, all rights arising therefrom remain with the Licensor.</p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    13. Warranty\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">The Software is provided in the condition corresponding to its current state of development (\"as is\").</p>\r\n  <p style=\"margin:0 0 6px;\">In particular, the Licensor gives no warranty that:</p>\r\n  <ul style=\"margin:0 0 18px; padding-left:20px;\">\r\n    <li>the Software is free of errors,</li>\r\n    <li>it is available at all times,</li>\r\n    <li>it meets all of the Licensee\'s individual legal or organizational requirements.</li>\r\n  </ul>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    14. Liability\r\n  </div>\r\n  <p style=\"margin:0 0 10px;\">\r\n    The Licensor is liable without limitation for intent and gross negligence, as well as under the provisions of the German\r\n    Product Liability Act. The Licensor is likewise liable without limitation for injury to life, body, or health, regardless\r\n    of the degree of fault.\r\n  </p>\r\n  <p style=\"margin:0 0 10px;\">\r\n    In the case of slightly negligent breach of material contractual obligations (cardinal obligations), the fulfillment of\r\n    which is essential to the proper performance of the agreement and on the observance of which the Licensee may regularly\r\n    rely, the Licensor\'s liability is limited in amount to the foreseeable damage typical for this type of contract at the\r\n    time the agreement was concluded.\r\n  </p>\r\n  <p style=\"margin:0 0 10px;\">\r\n    Otherwise, the Licensor\'s liability for slight negligence is excluded, in particular for indirect damages, loss of profit,\r\n    and loss of data, to the extent permitted by law.\r\n  </p>\r\n  <p style=\"margin:0 0 18px;\">\r\n    The Licensor is not liable for damages arising in connection with hosting provided by an authorized Partner, insofar as\r\n    the cause lies within the Partner\'s area of responsibility; in that case, the Partner is liable in accordance with the\r\n    contractual relationship existing between it and the Licensee.\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    15. Confidentiality\r\n  </div>\r\n  <p style=\"margin:0 0 18px;\">\r\n    The Licensee undertakes to treat as confidential all non-public information that comes to its knowledge in connection with the Software.\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    16. Governing Law and Jurisdiction\r\n  </div>\r\n  <p style=\"margin:0 0 10px;\">This agreement is governed by the law of the Federal Republic of Germany, excluding the UN Convention on Contracts for the International Sale of Goods (CISG).</p>\r\n  <p style=\"margin:0 0 18px;\">\r\n    If the Licensee is a merchant within the meaning of the German Commercial Code, a legal entity under public law, or a\r\n    special fund under public law, the place of jurisdiction for all disputes arising from or in connection with this agreement\r\n    shall be the registered office of the Licensor. The statutory provisions on jurisdiction apply with respect to consumers.\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    17. Final Provisions\r\n  </div>\r\n  <p style=\"margin:0 0 10px;\">Amendments and additions to this agreement must be made in text form. This also applies to any waiver of this form requirement.</p>\r\n  <p style=\"margin:0 0 18px;\">Should individual provisions of this agreement be or become invalid, the validity of the remaining provisions shall remain unaffected.</p>\r\n\r\n  <p style=\"font-size:0.8rem; color:#888; margin:10px 0 0; border-top:1px solid #e0e8f0; padding-top:8px; font-style:italic;\">\r\n    © WolfInfoSec Wolfgang Schuster – All rights reserved\r\n  </p>\r\n\r\n</div>'),
(18, 'isms_en', 'What is a ISMS?', '<div class=\"isms-intro-card\" style=\"background:#fff; border:1px solid #d0dde8; border-radius:10px; padding:20px 24px; max-width:820px; margin:0 0 16px; border-top:4px solid #2E5F8A; font-family:Arial, Helvetica, sans-serif; color:#333; line-height:1.55;\">\r\n\r\n  <h2 style=\"color:#2E5F8A; font-size:1.25rem; margin:0 0 4px;\">🛡️ Information Security Management System (ISMS) – General Introduction</h2>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    What Is an ISMS?\r\n  </div>\r\n  <p style=\"margin:0 0 10px;\">\r\n    An Information Security Management System (ISMS) is a <strong>systematic, structured approach</strong>\r\n    to <strong>appropriately protecting</strong> information and information-processing systems.<br>\r\n    Its aim is to <strong>continuously identify, assess, and manage</strong> risks to information.\r\n  </p>\r\n  <p style=\"margin:0 0 18px;\">\r\n    An ISMS looks at information security <strong>holistically</strong> – not just technically, but also organizationally and in terms of people.\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    Objectives of an ISMS\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">An effective ISMS pursues, in particular, the following objectives:</p>\r\n  <ul style=\"margin:0 0 18px; padding-left:20px;\">\r\n    <li>Protection of information and IT systems</li>\r\n    <li>Ensuring\r\n      <ul style=\"margin:6px 0 0; padding-left:20px;\">\r\n        <li><strong>Confidentiality</strong> (access only for authorized persons)</li>\r\n        <li><strong>Integrity</strong> (accuracy and completeness)</li>\r\n        <li><strong>Availability</strong> (timely usability)</li>\r\n      </ul>\r\n    </li>\r\n    <li>Compliance with legal, regulatory, and contractual requirements</li>\r\n    <li>Reduction of security incidents and damages</li>\r\n    <li>Transparency and demonstrable evidence toward management, customers, and auditors</li>\r\n  </ul>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    Why an ISMS Is Necessary\r\n  </div>\r\n  <p style=\"margin:0 0 10px;\">\r\n    Information security is today a <strong>critical success factor</strong>.<br>\r\n    Organizations face, among others, the following challenges:\r\n  </p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>Increasing cyber threats</li>\r\n    <li>Growing regulatory requirements</li>\r\n    <li>Complex IT and supply chains</li>\r\n    <li>Dependence on digital processes</li>\r\n    <li>High requirements for evidence and compliance</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 18px;\">\r\n    An ISMS ensures that information security is <strong>not left to chance</strong>, but rather\r\n    <strong>planned, managed, and reviewed</strong>.\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    Core Principles of an ISMS\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">An ISMS is based on clear principles:</p>\r\n  <ul style=\"margin:0 0 18px; padding-left:20px;\">\r\n    <li><strong>Risk orientation</strong><br>Security measures are implemented where they are needed</li>\r\n    <li style=\"margin-top:8px;\"><strong>Accountability</strong><br>Roles and responsibilities are clearly defined</li>\r\n    <li style=\"margin-top:8px;\"><strong>Documentation &amp; traceability</strong><br>Decisions and implementations are documented in a traceable manner</li>\r\n    <li style=\"margin-top:8px;\"><strong>Continuous improvement</strong><br>Information security keeps evolving on an ongoing basis</li>\r\n  </ul>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    The ISMS Control Cycle (PDCA)\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">An ISMS follows a continuous improvement process, often represented as the PDCA cycle:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li><strong>Plan</strong><br>Define objectives, analyze risks, plan measures</li>\r\n    <li style=\"margin-top:8px;\"><strong>Do</strong><br>Implement measures, establish processes</li>\r\n    <li style=\"margin-top:8px;\"><strong>Check</strong><br>Review effectiveness, conduct audits, evaluate metrics</li>\r\n    <li style=\"margin-top:8px;\"><strong>Act</strong><br>Derive improvements, make adjustments</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 18px;\">This cycle ensures that the ISMS remains <strong>alive and up to date</strong>.</p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    Core Building Blocks of an ISMS\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">An ISMS consists of several interlinked areas:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li><strong>Documents &amp; policies</strong> – requirements and rule sets</li>\r\n    <li><strong>Assets</strong> – valuable assets of the organization worth protecting</li>\r\n    <li><strong>Risks</strong> – threats and vulnerabilities</li>\r\n    <li><strong>Measures</strong> – concrete protective and improvement measures</li>\r\n    <li><strong>Supplier management</strong> – managing external risks</li>\r\n    <li><strong>Personnel management</strong> – roles, training, and awareness</li>\r\n    <li><strong>Deadlines</strong> – due dates, reviews, and recurring tasks</li>\r\n    <li><strong>Audits</strong> – review and improvement</li>\r\n    <li><strong>Standards</strong> – external and internal requirements</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 18px;\">These building blocks interlock and together form the ISMS.</p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    Roles and Responsibility in the ISMS\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">An ISMS is a <strong>shared responsibility</strong>. Typical roles include:</p>\r\n  <ul style=\"margin:0 0 18px; padding-left:20px;\">\r\n    <li><strong>Management</strong><br>Accountability, setting objectives, approvals</li>\r\n    <li style=\"margin-top:8px;\"><strong>Information Security Officers (ISO / CISO)</strong><br>Steering, coordination, and further development of the ISMS</li>\r\n    <li style=\"margin-top:8px;\"><strong>Subject-matter and IT owners</strong><br>Implementation of measures within their areas</li>\r\n    <li style=\"margin-top:8px;\"><strong>Employees</strong><br>Compliance with security requirements in day-to-day work</li>\r\n  </ul>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    ISMS as Part of the Organization\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">An ISMS is <strong>not an isolated IT project</strong>, but rather:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>Part of corporate governance</li>\r\n    <li>Supports business objectives</li>\r\n    <li>Integrates into existing processes</li>\r\n    <li>Grows together with the organization</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 6px;\">A well-implemented ISMS increases not only security, but also:</p>\r\n  <ul style=\"margin:0 0 18px; padding-left:20px;\">\r\n    <li>Stability,</li>\r\n    <li>Trust,</li>\r\n    <li>Professionalism.</li>\r\n  </ul>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    Role of This ISMS Portal\r\n  </div>\r\n  <p style=\"margin:0 0 6px;\">This ISMS portal serves as a <strong>central platform</strong> for:</p>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>Documenting all ISMS elements</li>\r\n    <li>Managing risks and measures</li>\r\n    <li>Meeting standards and audit requirements</li>\r\n    <li>Providing transparency for management and employees</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 18px;\">\r\n    The help pages support using the ISMS in a way that is <strong>understandable, consistent, and efficient</strong>.\r\n  </p>\r\n\r\n  <div style=\"background:#f0f4ff; border:1px solid #c7d4f5; border-left:4px solid #0078d4; border-radius:8px; padding:12px 16px; margin:0 0 4px;\">\r\n    <strong style=\"color:#0078d4;\">Recommended next steps for new users:</strong>\r\n    <ol style=\"margin:8px 0 0; padding-left:20px; font-size:0.9rem; color:#333;\">\r\n      <li>Get an overview of documents and policies</li>\r\n      <li>Review or record relevant assets</li>\r\n      <li>Understand and assess risks</li>\r\n      <li>Track measures and deadlines</li>\r\n      <li>Know your own role within the ISMS</li>\r\n    </ol>\r\n  </div>\r\n\r\n</div>');
INSERT INTO `ismshilfe` (`id`, `seite`, `name`, `Text`) VALUES
(19, 'kitext_de', 'KI-Nutzung', '<div class=\"ki-hinweis-card\" style=\"background:#fff; border:1px solid #d0dde8; border-radius:10px; padding:20px 24px; max-width:820px; margin:0 0 16px; border-top:4px solid #2E5F8A; font-family:Arial, Helvetica, sans-serif; color:#333; line-height:1.55;\">\r\n\r\n  <h2 style=\"color:#2E5F8A; font-size:1.25rem; margin:0 0 4px;\">🤖 Hinweis zur KI-Nutzung bei der Entwicklung von WolfISMS</h2>\r\n  <p style=\"font-size:0.82rem; color:#888; margin:0 0 18px;\">Transparenzhinweis gemäß EU KI-Verordnung (Verordnung (EU) 2024/1689)</p>\r\n\r\n  <p style=\"margin:0 0 16px;\">\r\n    Im Rahmen der Entwicklung und des Betriebs der Software WolfISMS wird KI in zwei unterschiedlichen Kontexten eingesetzt.\r\n    Zur Wahrung von Transparenz und Nachvollziehbarkeit wird hierzu Folgendes festgehalten:\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    1. KI-Nutzung während der Softwareentwicklung\r\n  </div>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>Die KI-Unterstützung erfolgte ausschließlich <strong>fragmentweise und anlassbezogen</strong>, d.&nbsp;h. es wurden einzelne, klar abgegrenzte Code-Abschnitte, Funktionen oder Teilprobleme zur Bearbeitung angefragt.</li>\r\n    <li>Es fand <strong>kein autonomes Coding</strong> statt. Die KI hatte zu keinem Zeitpunkt eigenständigen, unüberwachten Zugriff auf das Gesamtsystem, die Produktivumgebung oder die Codebasis als Ganzes.</li>\r\n    <li>Sämtliche Architektur-, Sicherheits- und Designentscheidungen wurden durch den Entwickler getroffen und verantwortet.</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 6px;\"><strong>Qualitätssicherung:</strong></p>\r\n  <p style=\"margin:0 0 18px;\">\r\n    Jeder von der KI vorgeschlagene oder mitgestaltete Code-Abschnitt wurde vor der Übernahme durch den Entwickler manuell geprüft und freigegeben.\r\n    Es erfolgen regelmäßige Sicherheitsüberprüfungen des Gesamtcodes (u.&nbsp;a. Review auf Schwachstellen, Prüfung von Abhängigkeiten,\r\n    Kontrolle sicherheitsrelevanter Funktionen wie Authentifizierung, Rechteverwaltung und Datenverarbeitung).\r\n    Die Verantwortung für Korrektheit, Sicherheit und Konformität des Endprodukts verbleibt vollständig beim menschlichen Entwickler.\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    2. KI-Funktion innerhalb des Produkts (Laufzeit-Nutzung durch Anwender)\r\n  </div>\r\n  <p style=\"margin:0 0 10px;\">\r\n    WolfISMS enthält zusätzlich ein <strong>optionales, standardmäßig deaktiviertes</strong> KI-Modul zur unterstützenden Überarbeitung von\r\n    Dokumententexten (z.&nbsp;B. Richtlinien im Kontext ISO 27001/NIS2). Dieses ist von der oben beschriebenen Entwicklungsunterstützung strikt\r\n    zu unterscheiden: Hier wird zur <strong>Laufzeit des Produkts</strong>, durch den <strong>Anwender selbst ausgelöst</strong>, ein externes\r\n    KI-Modell angebunden.\r\n  </p>\r\n  <ul style=\"margin:0 0 18px; padding-left:20px;\">\r\n    <li>Die Funktion muss durch die Administration aktiv eingeschaltet werden (Opt-in).</li>\r\n    <li>Auslösung erfolgt ausschließlich durch explizite Nutzeraktion; es gibt keinen automatisierten Hintergrundlauf.</li>\r\n    <li>Der Dokumententext wird an das konfigurierte externe KI-Modell übertragen; der Vorschlag wird erst nach expliziter Bestätigung durch den Nutzer übernommen.</li>\r\n    <li>Konfigurierbare Anbieter: Anthropic, Microsoft Azure OpenAI (Azure AI Foundry / Copilot-Deployments), sowie benutzerdefinierte/kompatible Endpunkte.</li>\r\n  </ul>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    3. Verantwortlichkeit bei Anbindung externer Modelle\r\n  </div>\r\n  <p style=\"margin:0 0 10px;\">\r\n    Die Anbindung externer KI-Modelle wirft eine <strong>geteilte Verantwortung</strong> zwischen Softwarehersteller (WolfISMS) und Betreiber\r\n    der Instanz auf. Diese lässt sich wie folgt abgrenzen:\r\n  </p>\r\n\r\n  <table style=\"width:100%; border-collapse:collapse; margin:0 0 18px; font-size:0.88rem;\">\r\n    <thead>\r\n      <tr style=\"background:#f5f8fb;\">\r\n        <th style=\"text-align:left; padding:8px 10px; border:1px solid #d0dde8; width:22%;\">Verantwortungsbereich</th>\r\n        <th style=\"text-align:left; padding:8px 10px; border:1px solid #d0dde8; width:15%;\">Zuständig</th>\r\n        <th style=\"text-align:left; padding:8px 10px; border:1px solid #d0dde8;\">Beschreibung</th>\r\n      </tr>\r\n    </thead>\r\n    <tbody>\r\n      <tr>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Bereitstellung der Schnittstelle</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">WolfISMS (Hersteller)</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Bereitstellung einer technisch sicheren Anbindungsmöglichkeit (Konfigurationsoberfläche, Speicherung der Zugangsdaten, Übertragungsmechanismus), Sicherstellung, dass die Funktion standardmäßig deaktiviert ist und ohne explizite Bestätigung nichts übernommen wird.</td>\r\n      </tr>\r\n      <tr>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Auswahl des Anbieters</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Betreiber (Kunde/Admin)</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Entscheidung, welcher externe KI-Anbieter genutzt wird; Prüfung von dessen AGB, Datenschutzbestimmungen und Sicherheitsniveau.</td>\r\n      </tr>\r\n      <tr>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Rechtsgrundlage der Datenübermittlung</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Betreiber</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Sicherstellung einer wirksamen Auftragsverarbeitungsvereinbarung (AVV) mit dem gewählten KI-Anbieter, insbesondere bei personenbezogenen Daten in den übertragenen Dokumenten; Prüfung von Drittlandtransfers (z.&nbsp;B. USA) und ggf. erforderlicher Garantien (SCCs).</td>\r\n      </tr>\r\n      <tr>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Inhaltliche Freigabe der KI-Ausgabe</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Anwender (Nutzer im System)</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Prüfung und explizite Bestätigung des von der KI vorgeschlagenen Textes vor Übernahme in das Managementsystem.</td>\r\n      </tr>\r\n      <tr>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Betrieb und Verhalten des KI-Modells selbst</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Externer KI-Anbieter</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Trainingsdaten, Modellverhalten, Verfügbarkeit, Sicherheit der eigenen Infrastruktur – liegt vollständig außerhalb des Einflussbereichs von WolfISMS.</td>\r\n      </tr>\r\n      <tr>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Klassifizierung als Hochrisiko-KI-System (falls einschlägig)</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Betreiber, ggf. in Abstimmung mit Anbieter</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">WolfISMS selbst stuft die Funktion als Unterstützungswerkzeug mit obligatorischer menschlicher Bestätigung ein (kein autonomer Entscheid). Der Betreiber bleibt jedoch verantwortlich für die eigene Einordnung im jeweiligen Einsatzkontext, insbesondere wenn Dokumente mit hoher Kritikalität verarbeitet werden.</td>\r\n      </tr>\r\n    </tbody>\r\n  </table>\r\n\r\n  <div style=\"background:#f0f4ff; border:1px solid #c7d4f5; border-left:4px solid #0078d4; border-radius:8px; padding:12px 16px; margin:0 0 14px;\">\r\n    <strong style=\"color:#0078d4;\">Kernaussage:</strong>\r\n    <span style=\"font-size:0.9rem; color:#333;\">\r\n      WolfISMS als Software stellt lediglich die technische Anbindung und die Sicherheitsvorkehrungen (Opt-in, Bestätigungspflicht,\r\n      maskierte Speicherung der Zugangsdaten) bereit. Die <strong>datenschutzrechtliche und vertragliche Verantwortung für die konkrete\r\n      Datenübermittlung an den gewählten externen KI-Anbieter liegt beim Betreiber der Instanz</strong>, nicht beim Softwarehersteller.\r\n      Der Softwarehersteller haftet nicht für das Verhalten, die Trainingsdaten oder die Sicherheit der Infrastruktur des vom Kunden\r\n      gewählten KI-Anbieters.\r\n    </span>\r\n  </div>\r\n\r\n  <p style=\"font-size:0.8rem; color:#888; margin:10px 0 0; border-top:1px solid #e0e8f0; padding-top:8px;\">\r\n    Stand: [Datum einfügen] &nbsp;·&nbsp; Verantwortlich: [Name/Funktion einfügen]\r\n  </p>\r\n\r\n</div>'),
(20, 'kitext_en', 'Use of AI', '<div class=\"ai-notice-card\" style=\"background:#fff; border:1px solid #d0dde8; border-radius:10px; padding:20px 24px; max-width:820px; margin:0 0 16px; border-top:4px solid #2E5F8A; font-family:Arial, Helvetica, sans-serif; color:#333; line-height:1.55;\">\r\n\r\n  <h2 style=\"color:#2E5F8A; font-size:1.25rem; margin:0 0 4px;\">🤖 Notice on the Use of AI in the Development of WolfISMS</h2>\r\n  <p style=\"font-size:0.82rem; color:#888; margin:0 0 18px;\">Transparency notice pursuant to the EU AI Act (Regulation (EU) 2024/1689)</p>\r\n\r\n  <p style=\"margin:0 0 16px;\">\r\n    AI is used in two distinct contexts in connection with the development and operation of the WolfISMS software.\r\n    In the interest of transparency and traceability, the following is documented:\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    1. Use of AI During Software Development\r\n  </div>\r\n  <ul style=\"margin:0 0 10px; padding-left:20px;\">\r\n    <li>AI assistance was used exclusively on a <strong>fragmentary, case-by-case basis</strong>, meaning individual, clearly scoped code sections, functions, or sub-problems were submitted for processing.</li>\r\n    <li><strong>No autonomous coding</strong> took place. At no point did the AI have independent, unsupervised access to the overall system, the production environment, or the codebase as a whole.</li>\r\n    <li>All architectural, security, and design decisions were made and remain the responsibility of the developer.</li>\r\n  </ul>\r\n  <p style=\"margin:0 0 6px;\"><strong>Quality assurance:</strong></p>\r\n  <p style=\"margin:0 0 18px;\">\r\n    Every code section suggested or co-authored by the AI was manually reviewed and approved by the developer before being adopted.\r\n    Regular security reviews of the overall codebase are carried out (including review for vulnerabilities, dependency checks,\r\n    and targeted review of security-relevant functions such as authentication, access control, and data processing).\r\n    Responsibility for the correctness, security, and compliance of the final product remains entirely with the human developer.\r\n  </p>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    2. AI Feature Within the Product (Runtime Use by Users)\r\n  </div>\r\n  <p style=\"margin:0 0 10px;\">\r\n    WolfISMS additionally includes an <strong>optional, disabled-by-default</strong> AI module for assisting with the revision of\r\n    document texts (e.g., policies in the context of ISO 27001/NIS2). This must be strictly distinguished from the development\r\n    support described above: here, an external AI model is connected <strong>at product runtime</strong>, triggered\r\n    <strong>by the user themselves</strong>.\r\n  </p>\r\n  <ul style=\"margin:0 0 18px; padding-left:20px;\">\r\n    <li>The feature must be actively enabled by the administration (opt-in).</li>\r\n    <li>It is triggered exclusively by an explicit user action; there is no automated background execution.</li>\r\n    <li>The document text is transmitted to the configured external AI model; the suggestion is only adopted after explicit confirmation by the user.</li>\r\n    <li>Configurable providers: Anthropic, Microsoft Azure OpenAI (Azure AI Foundry / Copilot deployments), as well as custom/compatible endpoints.</li>\r\n  </ul>\r\n\r\n  <div style=\"background:#eef2f7; border-left:4px solid #2E5F8A; padding:6px 12px; margin:18px 0 10px; font-weight:bold;\">\r\n    3. Responsibility When Connecting External Models\r\n  </div>\r\n  <p style=\"margin:0 0 10px;\">\r\n    Connecting external AI models results in a <strong>shared responsibility</strong> between the software manufacturer (WolfISMS)\r\n    and the operator of the instance. This can be broken down as follows:\r\n  </p>\r\n\r\n  <table style=\"width:100%; border-collapse:collapse; margin:0 0 18px; font-size:0.88rem;\">\r\n    <thead>\r\n      <tr style=\"background:#f5f8fb;\">\r\n        <th style=\"text-align:left; padding:8px 10px; border:1px solid #d0dde8; width:22%;\">Area of responsibility</th>\r\n        <th style=\"text-align:left; padding:8px 10px; border:1px solid #d0dde8; width:15%;\">Responsible party</th>\r\n        <th style=\"text-align:left; padding:8px 10px; border:1px solid #d0dde8;\">Description</th>\r\n      </tr>\r\n    </thead>\r\n    <tbody>\r\n      <tr>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Provision of the interface</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">WolfISMS (manufacturer)</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Provision of a technically secure connection mechanism (configuration interface, storage of credentials, transmission mechanism), ensuring the feature is disabled by default and that nothing is adopted without explicit confirmation.</td>\r\n      </tr>\r\n      <tr>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Choice of provider</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Operator (customer/admin)</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Decision on which external AI provider is used; review of that provider\'s terms of service, data protection provisions, and security posture.</td>\r\n      </tr>\r\n      <tr>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Legal basis for the data transfer</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Operator</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Ensuring a valid data processing agreement (DPA) with the chosen AI provider, particularly where personal data is contained in the transmitted documents; review of third-country transfers (e.g., to the USA) and any required safeguards (SCCs).</td>\r\n      </tr>\r\n      <tr>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Substantive approval of the AI output</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">User (person using the system)</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Review and explicit confirmation of the text suggested by the AI before it is adopted into the management system.</td>\r\n      </tr>\r\n      <tr>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Operation and behavior of the AI model itself</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">External AI provider</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Training data, model behavior, availability, and security of its own infrastructure — entirely outside WolfISMS\'s sphere of influence.</td>\r\n      </tr>\r\n      <tr>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Classification as a high-risk AI system (if applicable)</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">Operator, if applicable in coordination with the provider</td>\r\n        <td style=\"padding:8px 10px; border:1px solid #d0dde8;\">WolfISMS itself classifies the feature as a supporting tool with mandatory human confirmation (no autonomous decision-making). However, the operator remains responsible for its own classification in the respective context of use, particularly when documents of high criticality are processed.</td>\r\n      </tr>\r\n    </tbody>\r\n  </table>\r\n\r\n  <div style=\"background:#f0f4ff; border:1px solid #c7d4f5; border-left:4px solid #0078d4; border-radius:8px; padding:12px 16px; margin:0 0 14px;\">\r\n    <strong style=\"color:#0078d4;\">Key statement:</strong>\r\n    <span style=\"font-size:0.9rem; color:#333;\">\r\n      WolfISMS as a software product only provides the technical connection and the associated safeguards (opt-in, confirmation\r\n      requirement, masked storage of credentials). The <strong>data protection and contractual responsibility for the actual\r\n      transmission of data to the chosen external AI provider lies with the operator of the instance</strong>, not with the software\r\n      manufacturer. The software manufacturer is not liable for the behavior, training data, or infrastructure security of the\r\n      AI provider selected by the customer.\r\n    </span>\r\n  </div>\r\n\r\n  <p style=\"font-size:0.8rem; color:#888; margin:10px 0 0; border-top:1px solid #e0e8f0; padding-top:8px;\">\r\n    Version date: [insert date] &nbsp;·&nbsp; Responsible: [insert name/role]\r\n  </p>\r\n\r\n</div>');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `isms_settings`
--

CREATE TABLE `isms_settings` (
  `key` varchar(64) NOT NULL,
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `isms_settings`
--

INSERT INTO `isms_settings` (`key`, `value`) VALUES
('ki_api_base_url', ''),
('ki_api_version', '2024-02-01'),
('ki_copilot_deployment', ''),
('ki_enabled', '1'),
('ki_model', 'claude-opus-4-5'),
('ki_prompt_addendum', ''),
('ki_provider', 'anthropic'),
('pdf_briefpapier_dir', '/var/www/isms/uploads/briefpapier'),
('pdf_briefpapier_margin_bottom', '2.5'),
('pdf_briefpapier_margin_left', '2.5'),
('pdf_briefpapier_margin_right', '2.5'),
('pdf_briefpapier_margin_top', '5'),
('pdf_briefpapier_path', '/var/www/isms/branding/briefpapier_226a0409.pdf'),
('totp_required', '0');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `klassifizierung`
--

CREATE TABLE `klassifizierung` (
  `id` int(10) UNSIGNED NOT NULL,
  `klassifizierung` varchar(256) NOT NULL,
  `klassifizierung_en` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `klassifizierung`
--

INSERT INTO `klassifizierung` (`id`, `klassifizierung`, `klassifizierung_en`) VALUES
(1, 'öffentlich', 'public'),
(2, 'intern', 'internal'),
(3, 'vertraulich', 'confidential'),
(4, 'streng vertraulich', 'high confidential');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `klassifizierung_en`
--

CREATE TABLE `klassifizierung_en` (
  `id` int(10) UNSIGNED NOT NULL,
  `klassifizierung` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `klassifizierung_en`
--

INSERT INTO `klassifizierung_en` (`id`, `klassifizierung`) VALUES
(1, 'public'),
(2, 'internal'),
(3, 'confidential'),
(4, 'high confidential');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kommentare`
--

CREATE TABLE `kommentare` (
  `id` int(11) NOT NULL,
  `bereich` varchar(20) NOT NULL,
  `objekt_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `text` text NOT NULL,
  `ersteller` varchar(20) NOT NULL,
  `erstellt` datetime NOT NULL,
  `geaendert` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kontakte_behoerden`
--

CREATE TABLE `kontakte_behoerden` (
  `id` int(11) NOT NULL,
  `behoerde` varchar(200) NOT NULL,
  `ansprechpartner` varchar(150) DEFAULT NULL,
  `telefon` varchar(60) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `website` varchar(300) DEFAULT NULL,
  `zustaendigkeit` varchar(200) DEFAULT NULL,
  `bemerkung` text DEFAULT NULL,
  `ersteller` int(11) DEFAULT NULL,
  `erstellt` date DEFAULT NULL,
  `aenderer` int(11) DEFAULT NULL,
  `geaendert` date DEFAULT NULL,
  `bemerkung_en` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kontakte_dienstleister`
--

CREATE TABLE `kontakte_dienstleister` (
  `id` int(11) NOT NULL,
  `firma` varchar(200) NOT NULL,
  `ansprechpartner` varchar(150) DEFAULT NULL,
  `position` varchar(150) DEFAULT NULL,
  `telefon` varchar(60) DEFAULT NULL,
  `mobil` varchar(60) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `website` varchar(300) DEFAULT NULL,
  `kategorie` varchar(100) DEFAULT NULL,
  `bemerkung` text DEFAULT NULL,
  `ersteller` int(11) DEFAULT NULL,
  `erstellt` date DEFAULT NULL,
  `aenderer` int(11) DEFAULT NULL,
  `geaendert` date DEFAULT NULL,
  `bemerkung_en` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kontakte_interessensgruppen`
--

CREATE TABLE `kontakte_interessensgruppen` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `ansprechpartner` varchar(150) DEFAULT NULL,
  `typ` varchar(100) DEFAULT NULL,
  `telefon` varchar(60) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `website` varchar(300) DEFAULT NULL,
  `relevanz` varchar(100) DEFAULT NULL,
  `bemerkung` text DEFAULT NULL,
  `ersteller` int(11) DEFAULT NULL,
  `erstellt` date DEFAULT NULL,
  `aenderer` int(11) DEFAULT NULL,
  `geaendert` date DEFAULT NULL,
  `bemerkung_en` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kontakte_kunden`
--

CREATE TABLE `kontakte_kunden` (
  `id` int(11) NOT NULL,
  `kundenname` varchar(200) NOT NULL,
  `kundennr` varchar(60) DEFAULT NULL,
  `ansprechpartner` varchar(150) DEFAULT NULL,
  `meldeadresse` varchar(300) DEFAULT NULL,
  `bemerkung` text DEFAULT NULL,
  `ersteller` int(11) DEFAULT NULL,
  `erstellt` date DEFAULT NULL,
  `aenderer` int(11) DEFAULT NULL,
  `geaendert` date DEFAULT NULL,
  `bemerkung_en` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kontakte_mitarbeiter`
--

CREATE TABLE `kontakte_mitarbeiter` (
  `id` int(11) NOT NULL,
  `vorname` varchar(100) DEFAULT NULL,
  `nachname` varchar(100) NOT NULL,
  `abteilung` varchar(100) DEFAULT NULL,
  `position` varchar(150) DEFAULT NULL,
  `telefon` varchar(60) DEFAULT NULL,
  `mobil` varchar(60) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `standort` varchar(150) DEFAULT NULL,
  `bemerkung` text DEFAULT NULL,
  `ersteller` int(11) DEFAULT NULL,
  `erstellt` date DEFAULT NULL,
  `aenderer` int(11) DEFAULT NULL,
  `geaendert` date DEFAULT NULL,
  `bemerkung_en` text DEFAULT NULL,
  `abteilung_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kritikalität`
--

CREATE TABLE `kritikalität` (
  `id` int(10) UNSIGNED NOT NULL,
  `kritikalität` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `kritikalität`
--

INSERT INTO `kritikalität` (`id`, `kritikalität`) VALUES
(1, 'niedrig'),
(2, 'normal'),
(3, 'hoch'),
(4, 'kritisch');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Links`
--

CREATE TABLE `Links` (
  `id` int(10) UNSIGNED NOT NULL,
  `bereich_id` int(10) UNSIGNED DEFAULT NULL,
  `bereich` varchar(256) DEFAULT NULL,
  `link` varchar(512) DEFAULT NULL,
  `bezeichnung` varchar(256) DEFAULT NULL,
  `ersteller` int(10) UNSIGNED NOT NULL,
  `datum` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Massnahmen`
--

CREATE TABLE `Massnahmen` (
  `id` int(10) UNSIGNED NOT NULL,
  `Nummer` varchar(64) DEFAULT NULL,
  `Name` varchar(128) DEFAULT NULL,
  `Besitzer` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `Abteilung` varchar(128) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `Enddatum` date NOT NULL DEFAULT current_timestamp(),
  `text` mediumtext DEFAULT NULL,
  `Ersteller` int(10) UNSIGNED NOT NULL,
  `Erstelldatum` date NOT NULL DEFAULT current_timestamp(),
  `Aenderer` int(10) UNSIGNED DEFAULT NULL,
  `Aenderungsdatum` date NOT NULL DEFAULT current_timestamp(),
  `Reviewer` int(10) UNSIGNED DEFAULT NULL,
  `review` date NOT NULL DEFAULT current_timestamp(),
  `archiviert` tinyint(1) NOT NULL DEFAULT 0,
  `erledigt` int(11) NOT NULL DEFAULT 0,
  `interner_aufwand` decimal(10,2) DEFAULT NULL COMMENT 'Interner Aufwand in Manntagen (MT), z.B. 1.5',
  `kosten` decimal(12,2) DEFAULT NULL COMMENT 'Kosten in EUR, z.B. 1000.00',
  `prioritaet` varchar(20) DEFAULT NULL COMMENT 'Priorität: niedrig, mittel, hoch, sehr hoch',
  `Name_en` text DEFAULT NULL,
  `text_en` text DEFAULT NULL,
  `abteilung_id` int(11) DEFAULT NULL,
  `Ticketnummer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mass_anhaenge`
--

CREATE TABLE `mass_anhaenge` (
  `id` int(11) NOT NULL,
  `mass_id` int(11) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `stored_name` varchar(255) NOT NULL,
  `rel_path` varchar(255) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `file_size` int(11) NOT NULL,
  `beschreibung` varchar(255) DEFAULT NULL,
  `ersteller` int(11) DEFAULT NULL,
  `erstellt` date NOT NULL,
  `aenderer` int(11) DEFAULT NULL,
  `geaendert` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mgmt_review`
--

CREATE TABLE `mgmt_review` (
  `id` int(10) UNSIGNED NOT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `von_datum` date DEFAULT NULL,
  `bis_datum` date DEFAULT NULL,
  `status_frueherer_massnahmen` mediumtext DEFAULT NULL,
  `aenderungen_themen` mediumtext DEFAULT NULL,
  `aenderungen_parteien` mediumtext DEFAULT NULL,
  `nichtkonformitaeten` mediumtext DEFAULT NULL,
  `ueberwachung_messung` mediumtext DEFAULT NULL,
  `interne_audits` mediumtext DEFAULT NULL,
  `rueckmeldungen_parteien` mediumtext DEFAULT NULL,
  `chancen_verbesserung` mediumtext DEFAULT NULL,
  `ersteller` int(10) UNSIGNED DEFAULT NULL,
  `erstellt_am` datetime NOT NULL DEFAULT current_timestamp(),
  `aenderer` int(10) UNSIGNED DEFAULT NULL,
  `geaendert_am` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `aenderungen_geschaeftsfelder` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Normen`
--

CREATE TABLE `Normen` (
  `id` int(11) UNSIGNED NOT NULL,
  `Norm` varchar(256) NOT NULL,
  `Kapitel` varchar(256) DEFAULT NULL,
  `Nummer` varchar(24) DEFAULT NULL,
  `Titel` varchar(256) DEFAULT NULL,
  `Beschreibung` text DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `anwendbar` tinyint(1) DEFAULT NULL,
  `Grund` text DEFAULT NULL,
  `Reviewer` int(10) UNSIGNED DEFAULT NULL,
  `review` date DEFAULT current_timestamp(),
  `Besitzer` int(10) UNSIGNED DEFAULT NULL,
  `dokumente` varchar(256) DEFAULT NULL,
  `massnahmen` varchar(256) DEFAULT NULL,
  `Änderer` int(10) UNSIGNED DEFAULT NULL,
  `geändert` date DEFAULT current_timestamp(),
  `Umsetzung` text DEFAULT NULL,
  `verwandte_normen` text DEFAULT NULL,
  `gelöscht` tinyint(1) NOT NULL DEFAULT 0,
  `Grund_en` text DEFAULT NULL,
  `Umsetzung_en` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `norm_status`
--

CREATE TABLE `norm_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `norm_status`
--

INSERT INTO `norm_status` (`id`, `status`) VALUES
(1, 'unbearbeitet'),
(2, 'nicht implementiert'),
(3, 'teilweise implementiert'),
(4, 'implementiert'),
(5, 'alternative Umsetzung'),
(6, 'in Bearbeitung'),
(7, 'nicht anwendbar');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `op_plan`
--

CREATE TABLE `op_plan` (
  `id` int(10) UNSIGNED NOT NULL,
  `kette_id` int(10) UNSIGNED NOT NULL,
  `aufgabe` text NOT NULL,
  `wer` int(10) UNSIGNED NOT NULL,
  `naechstes_datum` date NOT NULL,
  `frequenz_tage` smallint(5) UNSIGNED NOT NULL DEFAULT 30,
  `status` varchar(20) NOT NULL DEFAULT 'offen',
  `erledigt_am` date DEFAULT NULL,
  `erledigt_von` int(10) UNSIGNED DEFAULT NULL,
  `notiz` text DEFAULT NULL,
  `ist_aktuell` tinyint(1) NOT NULL DEFAULT 1,
  `ersteller` int(10) UNSIGNED NOT NULL,
  `erstellt_am` datetime NOT NULL DEFAULT current_timestamp(),
  `geaendert_am` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `link` varchar(500) DEFAULT NULL,
  `aufgabe_en` text DEFAULT NULL,
  `notiz_en` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Personal`
--

CREATE TABLE `Personal` (
  `id` int(11) UNSIGNED NOT NULL,
  `Personalnummer` varchar(64) NOT NULL,
  `Vorname` varchar(64) NOT NULL,
  `Nachname` varchar(64) NOT NULL,
  `Geburtsdatum` date NOT NULL,
  `Eintrittsdatum` date NOT NULL,
  `Austrittsdatum` date NOT NULL,
  `Abteilung` varchar(64) NOT NULL,
  `Rollen` varchar(256) NOT NULL,
  `Ersteller` int(11) UNSIGNED NOT NULL,
  `Datum` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `playbooks`
--

CREATE TABLE `playbooks` (
  `id` int(11) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `stored_name` varchar(255) NOT NULL,
  `rel_path` varchar(255) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `file_size` int(11) NOT NULL,
  `beschreibung` varchar(255) DEFAULT NULL,
  `ersteller` int(11) DEFAULT NULL,
  `erstellt` date NOT NULL,
  `aenderer` int(11) DEFAULT NULL,
  `geaendert` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `playbooks`
--

INSERT INTO `playbooks` (`id`, `original_name`, `stored_name`, `rel_path`, `mime_type`, `file_size`, `beschreibung`, `ersteller`, `erstellt`, `aenderer`, `geaendert`) VALUES
(5, 'Playbook_Audit.pdf', 'ea089021e11142088fd5026e4569d760_Playbook_Audit.pdf', 'play/', 'application/pdf', 105584, 'Audit- und Abweichungs-Playbook', 1, '2026-01-24', NULL, NULL),
(6, 'Playbook_Incident_Response.pdf', '6e611ada45ad4c2b84b021c20dbb85b5_Playbook_Incident_Response.pdf', 'play/', 'application/pdf', 107495, 'Incident-Response-Playbook (Sicherheitsvorfälle)', 1, '2026-01-24', NULL, NULL),
(7, 'Playbook_Lieferantenvorfall.pdf', 'd9ceb73e197e4293bc1550f4e2b4e67f_Playbook_Lieferantenvorfall.pdf', 'play/', 'application/pdf', 107066, 'Lieferantenvorfall-Playbook (Third-Party Incident)', 1, '2026-01-24', NULL, NULL),
(8, 'Playbook_Notfall.pdf', '51138947283544248e7fae1de6f5ff94_Playbook_Notfall.pdf', 'play/', 'application/pdf', 105190, 'Notfall- und Wiederanlauf-Playbook', 1, '2026-01-24', NULL, NULL),
(9, 'Playbook_Ransomware.pdf', 'f3135a2321374c03b5c3d448b80ca289_Playbook_Ransomware.pdf', 'play/', 'application/pdf', 105604, 'Ransomware-Playbook', 1, '2026-01-24', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Projekte`
--

CREATE TABLE `Projekte` (
  `id` int(10) UNSIGNED NOT NULL,
  `Nummer` varchar(64) DEFAULT NULL,
  `Name` varchar(128) DEFAULT NULL,
  `Besitzer` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(64) DEFAULT NULL,
  `Startdatum` date NOT NULL DEFAULT current_timestamp(),
  `Enddatum` date NOT NULL DEFAULT current_timestamp(),
  `Bezeichnung` mediumtext DEFAULT NULL,
  `Ersteller` int(10) UNSIGNED NOT NULL,
  `Erstelldatum` date NOT NULL DEFAULT current_timestamp(),
  `Aenderer` int(10) UNSIGNED DEFAULT NULL,
  `Aenderungsdatum` date NOT NULL DEFAULT current_timestamp(),
  `archiviert` tinyint(1) NOT NULL DEFAULT 0,
  `erledigt` int(11) NOT NULL DEFAULT 0,
  `massnahmen` varchar(4096) NOT NULL,
  `Name_en` text DEFAULT NULL,
  `Bezeichnung_en` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pw_reset_tokens`
--

CREATE TABLE `pw_reset_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(64) NOT NULL,
  `erstellt` datetime NOT NULL,
  `ablauf` datetime NOT NULL,
  `verwendet` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rechtsregister`
--

CREATE TABLE `rechtsregister` (
  `id` int(11) NOT NULL,
  `nummer` varchar(20) NOT NULL DEFAULT '',
  `rechtsgrundlage` varchar(255) NOT NULL DEFAULT '',
  `kuerzel` varchar(50) NOT NULL DEFAULT '',
  `kategorie` varchar(100) NOT NULL DEFAULT '',
  `themenbereich` varchar(100) NOT NULL DEFAULT '',
  `anforderung` text NOT NULL,
  `relevanz` text DEFAULT NULL,
  `bereiche` varchar(255) DEFAULT NULL,
  `verantwortlicher` varchar(255) DEFAULT NULL,
  `massnahme` text DEFAULT NULL,
  `dokumentenreferenz` varchar(255) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Zu prüfen',
  `faelligkeit` varchar(50) DEFAULT NULL,
  `letzte_pruefung` date DEFAULT NULL,
  `anmerkungen` text DEFAULT NULL,
  `ersteller` int(11) DEFAULT NULL,
  `erstellt` date DEFAULT NULL,
  `aenderer` int(11) DEFAULT NULL,
  `geaendert` date DEFAULT NULL,
  `anforderung_en` text DEFAULT NULL,
  `relevanz_en` text DEFAULT NULL,
  `massnahme_en` text DEFAULT NULL,
  `anmerkungen_en` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `rechtsregister`
--

INSERT INTO `rechtsregister` (`id`, `nummer`, `rechtsgrundlage`, `kuerzel`, `kategorie`, `themenbereich`, `anforderung`, `relevanz`, `bereiche`, `verantwortlicher`, `massnahme`, `dokumentenreferenz`, `status`, `faelligkeit`, `letzte_pruefung`, `anmerkungen`, `ersteller`, `erstellt`, `aenderer`, `geaendert`, `anforderung_en`, `relevanz_en`, `massnahme_en`, `anmerkungen_en`) VALUES
(1, '1.1', 'Datenschutz-Grundverordnung (EU) 2016/679', 'DSGVO', 'Datenschutz', 'Grundsätze', 'Art. 5: Verarbeitung personenbezogener Daten nach den Grundsätzen Rechtmäßigkeit, Zweckbindung, Datenminimierung, Richtigkeit, Speicherbegrenzung, Integrität & Vertraulichkeit', 'Verarbeitung von Kunden-, Lieferanten- und Mitarbeiterdaten', 'Alle Abteilungen', 'Datenschutzbeauftragter (DSB)', 'Datenschutzrichtlinie, Verzeichnis von Verarbeitungstätigkeiten (VVT)', 'DSB-POL-001', 'Konform', '31.12.2025', '2026-03-10', '', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(2, '1.2', 'Datenschutz-Grundverordnung (EU) 2016/679', 'DSGVO', 'Datenschutz', 'Verzeichnis der Verarbeitungstätigkeiten', 'Art. 30: Führung eines Verzeichnisses aller Verarbeitungstätigkeiten (VVT) durch Verantwortlichen und Auftragsverarbeiter', 'Pflicht für Unternehmen >250 MA oder bei risikoreicher Verarbeitung', 'IT, HR, Vertrieb, Einkauf', 'DSB', 'VVT erstellen und aktuell halten; mind. jährlich überprüfen', 'DSB-VVT-001', 'Konform', '31.12.2025', '2026-03-10', 'VVT liegt vor', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(3, '1.3', 'Datenschutz-Grundverordnung (EU) 2016/679', 'DSGVO', 'Datenschutz', 'Betroffenenrechte', 'Art. 12-23: Informationspflicht, Auskunftsrecht, Recht auf Löschung, Widerspruchsrecht, Datenportabilität – Frist 1 Monat', 'Anfragen von Mitarbeitern, Kunden, Bewerbern', 'HR, Vertrieb, IT', 'DSB', 'Prozess für Betroffenenanfragen, Schulung Mitarbeiter', 'DSB-PROC-002', 'In Umsetzung', '30.06.2025', '2026-03-10', 'Prozessvorlage in Erstellung', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(4, '1.4', 'Datenschutz-Grundverordnung (EU) 2016/679', 'DSGVO', 'Datenschutz', 'Datenschutz-Folgenabschätzung', 'Art. 35: DSFA bei voraussichtlich hohem Risiko (z.B. Videoüberwachung, umfangreiche Mitarbeiterüberwachung, neue Technologien)', 'Einsatz von Kamera-/Zugangskontrollsystemen, ERP-Einführung', 'IT, Werksleitung', 'DSB / CISO', 'DSFA-Verfahren definieren, bei Bedarf Aufsichtsbehörde konsultieren', 'DSB-DSFA-001', 'In Umsetzung', '30.09.2025', '2026-03-10', 'DSFA-Template vorhanden', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(5, '1.5', 'Datenschutz-Grundverordnung (EU) 2016/679', 'DSGVO', 'Datenschutz', 'Meldepflicht Datenpannen', 'Art. 33-34: Meldung von Datenschutzverletzungen an Aufsichtsbehörde binnen 72 Stunden; ggf. Benachrichtigung Betroffener', 'Jede Datenpanne (Verlust, unbefugter Zugriff, Offenlegung)', 'IT, DSB, Geschäftsführung', 'DSB / CISO', 'Incident-Response-Plan mit DSB-Meldepfad, Kommunikationsvorlage', 'ISM-IRP-001', 'Konform', '31.12.2025', '2026-03-10', 'Meldeweg definiert; Testübung ausstehend', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(6, '1.6', 'Datenschutz-Grundverordnung (EU) 2016/679', 'DSGVO', 'Datenschutz', 'Auftragsverarbeitung', 'Art. 28: Abschluss von Auftragsverarbeitungsverträgen (AVV) mit allen Dienstleistern, die personenbezogene Daten verarbeiten', 'Cloud-Dienste, externe IT-Dienstleister, Lohnabrechnung', 'Einkauf, IT, Recht', 'DSB', 'AVV-Vorlage, Dienstleisterliste pflegen', 'DSB-AVV-001', 'Konform', '31.12.2025', '2026-03-10', 'Alle aktiven AVV abgeschlossen', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(7, '1.7', 'Datenschutz-Grundverordnung (EU) 2016/679', 'DSGVO', 'Datenschutz', 'Datenschutzbeauftragter', 'Art. 37: Benennung eines DSB; Meldung an Aufsichtsbehörde', 'Je nach Unternehmensgröße und Verarbeitungsumfang', 'Geschäftsführung', 'Geschäftsführung', 'DSB benennen/bestellen, Kontaktdaten veröffentlichen', 'DSB-BESTELLUNG-001', 'Konform', '31.12.2025', '2026-03-10', 'DSB intern bestellt und gemeldet', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(8, '2.1', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'ISMS-Kontext', 'Kap. 4: Verstehen der Organisation, interne/externe Themen, interessierte Parteien und Geltungsbereich des ISMS', 'Grundlage für das gesamte ISMS', 'Geschäftsführung, CISO', 'CISO', 'Kontextanalyse, Scoping-Dokument erstellen', 'ISM-KON-001', 'In Umsetzung', '31.03.2025', '2026-03-10', 'Stakeholder-Analyse läuft', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(9, '2.2', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Risikobeurteilung', 'Kap. 6.1 / A 8.2: Informationssicherheits-Risikobeurteilung; Risikobehandlungsplan (RTP)', 'Identifikation aller Informationsrisiken im Unternehmen', 'CISO, IT, Fachabteilungen', 'CISO', 'Risikobewertungsmethodik, Asset-Inventar, Risikoregister', 'ISM-RISK-001', 'In Umsetzung', '30.06.2025', '2026-03-10', 'Risikobewertungs-Workshop geplant', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(10, '2.3', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'IS-Leitlinie', 'Kap. 5.2 / A 5.1: Informationssicherheitsleitlinie durch Geschäftsführung verabschiedet und kommuniziert', 'Grundsatzdokument für alle IS-Maßnahmen', 'Alle Mitarbeiter', 'CISO / Geschäftsführung', 'IS-Leitlinie erstellen, genehmigen, veröffentlichen', 'ISM-POL-001', 'Konform', '31.12.2025', '2026-03-10', 'Leitlinie v1.0 verabschiedet', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(11, '2.4', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Asset Management', 'A 5.9-5.12: Inventar aller Informationswerte, Klassifizierung, Kennzeichnung und sicherer Umgang', 'Hardware, Software, Daten, Dienste, Personen', 'IT, Einkauf', 'IT-Leiter', 'Asset-Inventar anlegen und pflegen, Klassifizierungsschema', 'ISM-ASSET-001', 'In Umsetzung', '31.07.2025', '2026-03-10', 'Asset-Inventar in Aufbau', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(12, '2.5', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Zugangs- und Zugriffskontrolle', 'A 5.15-5.18: Need-to-know-Prinzip, Benutzerregistrierung/-abmeldung, privilegierte Zugriffsrechte, Passwortverwaltung', 'Alle IT-Systeme, ERP, CAD-Umgebung', 'IT', 'IT-Leiter / CISO', 'IAM-Richtlinie, RBAC, Review mind. jährlich', 'ISM-IAM-001', 'In Umsetzung', '31.08.2025', '2026-03-10', 'AD-Gruppen-Review ausstehend', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2.6', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Kryptographie', 'A 8.24: Richtlinie für kryptographische Maßnahmen (Verschlüsselung, Schlüsselmanagement)', 'Datenübertragung, Datenspeicherung, E-Mail', 'IT', 'IT-Leiter', 'Krypto-Richtlinie, TLS 1.2+, Festplattenverschlüsselung', 'ISM-KRYPTO-001', 'In Umsetzung', '30.09.2025', '2026-03-10', '', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(14, '2.7', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Physische Sicherheit', 'A 7.1-7.14: Physische Zutrittskontrollen, Schutz vor Umweltbedrohungen, sicheres Arbeiten in Sicherheitsbereichen', 'Serverräume, Produktionshalle, Büros', 'Facility Management, IT', 'Werksleiter / IT-Leiter', 'Zutrittskonzept, Schließanlage, CCTV, Clean-Desk-Policy', 'ISM-PHYS-001', 'Konform', '31.12.2025', '2026-03-10', 'Serverraum-Zugang protokolliert', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(15, '2.8', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Betriebssicherheit', 'A 8.1-8.23: Change Management, Schutz vor Malware, Logging, Schwachstellenmanagement, Backups', 'IT-Betrieb, Produktionssysteme (OT/IT-Konvergenz)', 'IT', 'IT-Leiter', 'Change-Management-Prozess, AV-Lösung, SIEM, Backup-Konzept', 'ISM-OPS-001', 'In Umsetzung', '31.10.2025', '2026-03-10', 'SIEM-Einführung in Planung', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(16, '2.9', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Lieferantenbeziehungen', 'A 5.19-5.22: IS-Anforderungen in Lieferantenverträgen, Überwachung Lieferanten-Leistung', 'IT-Dienstleister, Maschinenzulieferer mit Fernwartungszugang', 'Einkauf, IT', 'CISO / Einkaufsleiter', 'Lieferanten-IS-Fragebogen, Vertragsklauseln, Audit-Rechte', 'ISM-SUPP-001', 'In Umsetzung', '30.11.2025', '2026-03-10', 'Kritische Lieferanten identifizieren', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(17, '2.10', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Incident Management', 'A 5.24-5.28: IS-Vorfallmanagement, Vorfallmeldung, Reaktion und Lessons Learned', 'Alle IS-Vorfälle (Cyberangriffe, Datenverlust, Systemausfall)', 'IT, CISO', 'CISO', 'Incident-Response-Plan, Meldeweg, regelmäßige Übungen', 'ISM-IRP-001', 'In Umsetzung', '31.12.2025', '2026-03-10', 'IRP v0.9 – Freigabe ausstehend', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(18, '2.11', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Business Continuity', 'A 5.29-5.30: IS-Aspekte im BCM, Redundanzen, Wiederherstellungszeiten (RTO/RPO)', 'Kritische Geschäftsprozesse, Produktion, ERP', 'IT, Geschäftsführung', 'CISO / Geschäftsführer', 'BCP/DRP erstellen, RTO/RPO definieren, Tests durchführen', 'ISM-BCP-001', 'Nicht begonnen', '31.03.2026', '2026-03-10', 'Hohe Priorität – BCM-Projekt einplanen', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(19, '2.12', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Compliance / Rechtsregister', 'A 5.31 / 18.1: Identifizierung gesetzlicher, regulatorischer und vertraglicher Anforderungen; Rechtsregister pflegen', 'Alle Compliance-relevanten Bereiche', 'CISO, DSB, Recht', 'CISO', 'Dieses Rechtsregister, jährliche Überprüfung, Änderungsmanagement', 'ISM-RR-001', 'Konform', '31.12.2025', '2026-03-10', 'Vorliegendes Dokument', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(20, '2.13', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Internes Audit', 'Kap. 9.2: Regelmäßige interne ISMS-Audits nach geplantem Auditprogramm', 'Gesamtes ISMS', 'CISO, interne Auditoren', 'CISO', 'Auditprogramm erstellen, Auditoren schulen, Berichte dokumentieren', 'ISM-AUDIT-001', 'In Umsetzung', '30.06.2025', '2026-03-10', 'Erstaudit für Q2 geplant', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(21, '2.14', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Managementbewertung', 'Kap. 9.3: Jährliche Managementbewertung des ISMS durch die Geschäftsführung', 'Gesamtes ISMS', 'Geschäftsführung', 'CISO', 'Management-Review-Protokoll, Kennzahlen, Verbesserungsmaßnahmen', 'ISM-MGR-001', 'In Umsetzung', '31.12.2025', '2026-03-10', 'Termin mit GF festlegen', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(22, '3.1', 'NIS-2-Richtlinie (EU) 2022/2555 / BSIG', 'NIS-2', 'Cybersicherheit', 'Registrierung', 'Art. 27: Registrierungspflicht wesentlicher und wichtiger Einrichtungen beim BSI', 'Maschinenbau i.d.R. Kategorie Wichtige Einrichtung (Verarbeitendes Gewerbe)', 'Geschäftsführung', 'Geschäftsführer / CISO', 'Selbsteinstufung vornehmen, ggf. Registrierung beim BSI', 'ISM-NIS2-001', 'In Umsetzung', 'Gemäß KRITIS-DachG', '2026-03-10', 'Branchenspezifische Schwellenwerte prüfen', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(23, '3.2', 'NIS-2-Richtlinie (EU) 2022/2555 / BSIG', 'NIS-2', 'Cybersicherheit', 'Risikomanagement', 'Art. 21: Geeignete TOM: Sicherheitskonzept, Netzwerksicherheit, Kryptographie, Zugriffskontrolle, Supply-Chain-Sicherheit', 'Gesamte IT-/OT-Infrastruktur, Produktionsnetzwerke', 'IT, OT, CISO', 'CISO', 'NIS-2-konforme Sicherheitsmaßnahmen auf Basis ISO 27001 implementieren', 'ISM-NIS2-002', 'In Umsetzung', '31.10.2025', '2026-03-10', 'Synergie mit ISO-27001-Maßnahmen nutzen', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(24, '3.3', 'NIS-2-Richtlinie (EU) 2022/2555 / BSIG', 'NIS-2', 'Cybersicherheit', 'Meldepflicht Sicherheitsvorfälle', 'Art. 23: Erstmeldung 24h, Folgemeldung 72h, Abschlussbericht 1 Monat an BSI', 'Alle erheblichen Cyber-Vorfälle', 'IT, CISO, Geschäftsführung', 'CISO', 'NIS-2-Meldeprozess in IRP integrieren, BSI-Meldeformular bereithalten', 'ISM-IRP-001', 'In Umsetzung', '31.08.2025', '2026-03-10', 'BSI-Meldeportal einrichten', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(25, '3.4', 'NIS-2-Richtlinie (EU) 2022/2555 / BSIG', 'NIS-2', 'Cybersicherheit', 'Lieferkettensicherheit', 'Art. 21 Abs. 2d: Sicherheit in der Lieferkette – Bewertung von Lieferanten und Dienstleistern', 'Zulieferer mit IT-Zugang, Cloud-Dienstleister, Fernwartungsanbieter', 'Einkauf, IT', 'CISO / Einkaufsleiter', 'Lieferanten-Sicherheitsbewertung, Vertragsklauseln, IS-Anforderungen', 'ISM-SUPP-001', 'In Umsetzung', '30.11.2025', '2026-03-10', '', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(26, '3.5', 'NIS-2-Richtlinie (EU) 2022/2555 / BSIG', 'NIS-2', 'Cybersicherheit', 'Schulung Geschäftsleitung', 'Art. 20: Leitungsorgane müssen IS-Schulungen absolvieren; persönliche Haftung bei Pflichtverletzungen', 'Gesamte Geschäftsführung und Führungsebene', 'Geschäftsführung', 'CISO', 'Jährliche IS-Schulung für GF/Management, Teilnahmenachweis', 'ISM-TRAIN-001', 'Nicht begonnen', '30.06.2025', '2026-03-10', 'DRINGEND: Schulungsplan erstellen', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(27, '3.6', 'NIS-2-Richtlinie (EU) 2022/2555 / BSIG', 'NIS-2', 'Cybersicherheit', 'Netzwerksicherheit', 'Art. 21: Netzwerksicherheit, Sicherheitsmonitoring, Perimeterschutz, Segmentierung IT/OT', 'Produktionsnetzwerk, Büronetzwerk, Fernwartungszugänge', 'IT', 'IT-Leiter / CISO', 'Firewall, IDS/IPS, Netzwerksegmentierung, Monitoring-Konzept', 'ISM-NET-001', 'In Umsetzung', '30.09.2025', '2026-03-10', 'OT/IT-Segmentierung prioritär', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(28, '3.7', 'NIS-2-Richtlinie (EU) 2022/2555 / BSIG', 'NIS-2', 'Cybersicherheit', 'Multi-Faktor-Authentifizierung', 'Art. 21 Abs. 2j: Einsatz von MFA oder kontinuierlicher Authentifizierung', 'Alle kritischen Systeme, Remote-Zugänge, Admin-Konten', 'IT', 'IT-Leiter', 'MFA für VPN, Admin-Konten, Cloud-Dienste einführen', 'ISM-IAM-001', 'In Umsetzung', '31.07.2025', '2026-03-10', 'MFA für VPN bereits aktiv; weitere Systeme ausstehend', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(29, '3.8', 'NIS-2-Richtlinie (EU) 2022/2555 / BSIG', 'NIS-2', 'Cybersicherheit', 'Business Continuity / Krisenmanagement', 'Art. 21 Abs. 2c: Aufrechterhaltung des Betriebs, Backupmanagement, Wiederherstellung, Krisenmanagement', 'Kritische Produktionssysteme, ERP, Kommunikation', 'IT, Produktion', 'CISO / Werksleiter', 'BCP, DRP, Backup-Tests, Krisenplan, Krisenübung', 'ISM-BCP-001', 'Nicht begonnen', '31.03.2026', '2026-03-10', 'Gemeinsam mit ISO-27001 BCP adressieren', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(30, '4.1', 'Bundesdatenschutzgesetz (BDSG)', 'BDSG', 'Datenschutz', 'Beschäftigtendatenschutz', 'SS 26, 88 ff. BDSG: Verarbeitung von Beschäftigtendaten nur für Zwecke des Beschäftigungsverhältnisses', 'HR-Prozesse, Zeiterfassung, Videoüberwachung am Arbeitsplatz', 'HR', 'DSB / HR-Leiter', 'Betriebsvereinbarungen prüfen/schließen, Löschkonzept für HR-Daten', 'DSB-HR-001', 'In Umsetzung', '30.09.2025', '2026-03-10', 'BV Videoüberwachung erforderlich', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(31, '4.2', 'IT-Sicherheitsgesetz 2.0 / BSIG', 'BSIG', 'Cybersicherheit', 'KRITIS-Pflichten', 'SS 8a ff. BSIG: Betreiber kritischer Infrastrukturen: angemessene Sicherheitsmaßnahmen, Meldepflichten, Nachweise alle 2 Jahre', 'Ggf. relevant wenn Schwellenwerte (500 Mio. EUR Umsatz, systemrelevant) erreicht', 'IT, CISO', 'CISO', 'Schwellenwert-Prüfung, ggf. BSI-Registrierung', 'ISM-NIS2-001', 'Zu prüfen', '31.12.2025', '2026-03-10', 'Schwellenwert aktuell unterschritten', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(32, '4.3', 'TTDSG', 'TTDSG', 'Datenschutz', 'Cookie-Einwilligung / Website', 'S 25 TTDSG: Einwilligung vor Setzen nicht-essenzieller Cookies; technischer Datenschutz bei Telemedien', 'Unternehmens-Website, Online-Kundenportal', 'Marketing, IT', 'DSB', 'Cookie-Banner, Datenschutzerklärung aktualisieren', 'DSB-WEB-001', 'Konform', '31.12.2025', '2026-03-10', '', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(33, '4.4', 'Handelsgesetzbuch (HGB) / AO', 'HGB/AO', 'Compliance', 'Aufbewahrungspflichten', 'S 257 HGB, S 147 AO: Geschäftliche Unterlagen 6-10 Jahre aufbewahren; elektronische Archivierung revisionssicher (GoBD)', 'Geschäftsbriefe, Buchhaltung, Verträge, Rechnungen', 'Buchhaltung, IT', 'CFO / IT-Leiter', 'DMS/Archivierungssystem (GoBD-konform), Löschkonzept', 'ISM-ARCH-001', 'Konform', '31.12.2025', '2026-03-10', 'Revisionssicheres Archiv im Einsatz', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(34, '4.5', 'Maschinenverordnung (EU) 2023/1230', 'ProdHaftG/MVO', 'Produktsicherheit', 'Cybersicherheit in Maschinen', 'MVO Art. 10 / Anhang I Kap. 1.1.9: Cybersicherheit als integraler Bestandteil der Maschinensicherheit (ab 20.01.2027)', 'Alle neu entwickelten Maschinen und Steuerungssysteme (SPS, HMI)', 'Entwicklung, Konstruktion', 'Entwicklungsleiter / CISO', 'Security-by-Design in Entwicklungsprozess integrieren, Risikobeurteilung erweitern', 'ISM-DEV-001', 'In Umsetzung', '20.01.2027', '2026-03-10', 'Umsetzungsfrist beachten!', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(35, '4.6', 'Cyber Resilience Act (EU) 2024/2847', 'CRA', 'Produktsicherheit', 'Cybersicherheitsanforderungen Produkte', 'CRA: Hersteller von Produkten mit digitalen Elementen müssen Cybersicherheitsanforderungen über den Lebenszyklus erfüllen; SBOM; CE', 'Vernetzte Maschinen, Steuerungen, IoT-Komponenten', 'Entwicklung, Konstruktion, Vertrieb', 'Entwicklungsleiter / CISO', 'CRA-Produktanalyse, SBOM erstellen, Update-Prozess definieren', 'ISM-DEV-002', 'Nicht begonnen', '11.12.2027', '2026-03-10', 'CRA-Taskforce einrichten', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(36, '5.1', 'EASA Part 21 – Zulassung (Verordnung (EU) Nr. 748/2012)', 'Part 21', 'Luftfahrt / Regulatorisch', 'Design & Produktion', 'Part 21 Subpart G (POA): Produktionsgenehmigung; Qualitätssicherungssystem, Konformitätsnachweise, EASA Form 1 / FAA 8130-3', 'Alle gefertigten Luftfahrtkomponenten und -baugruppen', 'Produktion, Qualität, Entwicklung', 'Qualitätsmanager / Accountable Manager', 'POA-Handbuch (POE), QM-System nach Part 21G, interne Audits, EASA-Überwachung', 'QM-POA-001', 'Konform', '31.12.2025', '2026-03-10', 'POA-Zertifikat vorhanden', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(37, '5.2', 'EASA Part 145 – Instandhaltungsbetriebe (Verordnung (EU) Nr. 1321/2014)', 'Part 145', 'Luftfahrt / Regulatorisch', 'Instandhaltung', 'Part 145: Genehmigung für Instandhaltung/Reparatur an Luftfahrtteilen; MOE, Certifying Staff, Quality System', 'Nur relevant falls Instandhaltungsleistungen erbracht werden', 'Produktion, Qualität', 'Accountable Manager / QM', 'Prüfen ob Part-145-Tätigkeit vorliegt; ggf. Genehmigung beantragen', 'QM-M145-001', 'Zu prüfen', '31.12.2025', '2026-03-10', 'Relevanz anhand Tätigkeitsprofil prüfen', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(38, '5.3', 'AS9100 Rev. D – QMS Luft- und Raumfahrt', 'AS9100D', 'Luftfahrt / Norm', 'Qualitätsmanagement', 'AS9100D: QMS für Luft- und Raumfahrt; Risikomanagement, Konfigurationsmanagement, FAI (AS9102), FOD-Prävention, Lieferantenmanagement', 'Gesamte Wertschöpfungskette Luftfahrtkomponenten', 'Alle Bereiche', 'Qualitätsmanager', 'AS9100-Zertifizierung anstreben/aufrechterhalten; QMS-Handbuch, interne Audits', 'QM-AS9100-001', 'Konform', '31.12.2025', '2026-03-10', 'Zertifikat vorhanden – Rezertifizierungsaudit prüfen', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(39, '5.4', 'EASA CS-25 / CS-23 – Zulassungsspezifikationen', 'CS-25/CS-23', 'Luftfahrt / Norm', 'Technische Normen', 'Certification Specifications: Komponenten müssen CS-Anforderungen und AMC genügen; Nachweise durch Analysen, Tests, Berechnungen', 'Alle sicherheitsrelevanten Bauteile (Primary/Secondary Structure, Systeme)', 'Entwicklung, Qualität', 'Chief Engineer / Entwicklungsleiter', 'Compliance-Matrix erstellen, Nachweisdokumentation (DDP), Koordination mit TC-Inhaber', 'QM-CS-001', 'In Umsetzung', '31.12.2025', '2026-03-10', 'Anforderungen je Kundenprojekt spezifisch', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(40, '5.5', 'DO-178C – Software Airborne Systems Certification', 'DO-178C', 'Luftfahrt / Norm', 'Software-Entwicklung', 'DO-178C: Entwicklungsstandard für sicherheitskritische Luftfahrtsoftware; DAL A-E; Pläne, Anforderungen, Design, Code, Test, CM', 'Alle Softwarekomponenten in Luftfahrtprodukten (Steuerung, Embedded)', 'Softwareentwicklung', 'Software-Entwicklungsleiter / DER', 'SW-Entwicklungspläne (PSAC, SDP, SVP), Tool Qualification, Reviews & Audits', 'QM-SW178-001', 'In Umsetzung', '31.12.2025', '2026-03-10', 'DAL-Einstufung je Funktion dokumentieren', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(41, '5.6', 'DO-254 – Design Assurance Airborne Electronic Hardware', 'DO-254', 'Luftfahrt / Norm', 'Hardware-Entwicklung', 'DO-254: Entwicklungsstandard für komplexe elektronische Hardware (FPGA, ASIC, PLDs); DAL; Validierung, Verifikation, CM', 'Elektronische Baugruppen, FPGAs, PLDs in Luftfahrtprodukten', 'Hardwareentwicklung', 'Hardware-Entwicklungsleiter', 'Hardware-Entwicklungspläne (PHAC, HDP, HVP), Hardware-Reviews', 'QM-HW254-001', 'Zu prüfen', '31.12.2025', '2026-03-10', 'Prüfen ob komplexe Elektronik im Portfolio', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(42, '5.7', 'ARP4754A – Development of Civil Aircraft and Systems', 'ARP4754A', 'Luftfahrt / Norm', 'Systementwicklung', 'ARP4754A: Systementwicklungsprozess; FHA, SSA, FMEA, FTA; Anforderungsmanagement, Verifikation & Validierung', 'Systemintegration Luftfahrtkomponenten', 'Entwicklung, Systems Engineering', 'Systems Engineer / Entwicklungsleiter', 'System Safety Plan, FHA/SSA-Dokumente, FMEA, Anforderungsmanagement-Tool', 'QM-ARP4754-001', 'In Umsetzung', '31.12.2025', '2026-03-10', 'Abstimmung mit Systemintegrator erforderlich', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(43, '5.8', 'Verordnung (EU) 2018/1139 – EASA Basisverordnung', 'EASA-BVO', 'Luftfahrt / Regulatorisch', 'Grundlegende Anforderungen', 'EASA Basisverordnung: Grundlegende Sicherheitsanforderungen; Rechtsrahmen für alle delegierten Verordnungen (Part 21, 145 etc.)', 'Alle Luftfahrtaktivitäten des Unternehmens', 'Geschäftsführung, QM', 'Accountable Manager', 'Einhaltung aller Part-Vorschriften; Accountable Manager benennen', 'QM-EASA-001', 'Konform', '31.12.2025', '2026-03-10', '', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(44, '5.9', 'ITAR (22 CFR 120-130) / EAR (15 CFR 730-774)', 'ITAR/EAR', 'Luftfahrt / Export-Kontrolle', 'Exportkontrolle', 'ITAR: US-Exportkontrolle Rüstungsgüter (USML); EAR: Dual-Use-Güter (CCL/ECCN); Genehmigungen, TCP, Mitarbeiterschulungen, Re-Export-Verbote', 'Alle Lieferungen von Komponenten in Luftfahrtanwendungen (v.a. USA, NATO)', 'Exportkontrollbeauftragter, Vertrieb, Einkauf', 'Exportkontrollbeauftragter (EKB)', 'Exportkontroll-Klassifizierung aller Produkte (ECCN/USML), TCP, Schulungen, Genehmigungen', 'EKB-ITAR-001', 'In Umsetzung', '30.09.2025', '2026-03-10', 'Rechtliche Prüfung durch Exportkontroll-Anwalt empfohlen', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(45, '5.10', 'Dual-Use-Verordnung (EU) 2021/821 / AWG / AWV', 'DualUse', 'Luftfahrt / Export-Kontrolle', 'Exportkontrolle', 'EU Dual-Use-VO: Genehmigungspflicht für Export; AWG/AWV: Außenwirtschaftsrecht; BAFA-Genehmigungen; Catch-All-Klausel', 'Alle Exporte von Produkten und Technologie in Drittländer', 'Exportkontrollbeauftragter, Vertrieb', 'EKB', 'Güterklassifizierung, BAFA-Genehmigungen, Endverbleibserklärungen, Schulungen', 'EKB-DUAL-001', 'In Umsetzung', '31.12.2025', '2026-03-10', 'BAFA-Liste und Sanktionslisten regelmäßig prüfen', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(46, '5.11', 'EN 9120 – QMS Luft- und Raumfahrt-Händler', 'EN9120', 'Luftfahrt / Norm', 'Lieferkette', 'EN 9120: Anforderungen an Rückverfolgbarkeit, Echtheitsprüfung (Counterfeit Parts, AS6081), Dokumentenmanagement, CoC, EASA Form 1', 'Einkauf und Weiterlieferung von Zukaufteilen für Luftfahrt', 'Einkauf, Lager, QM', 'Qualitätsmanager / Einkaufsleiter', 'Counterfeit-Parts-Prozess (AS6081), Lieferantenqualifizierung, CoC-Prüfung, Rückverfolgbarkeit', 'QM-EN9120-001', 'Zu prüfen', '31.12.2025', '2026-03-10', 'Relevanz prüfen je nach Lieferkettenfunktion', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(47, '5.12', 'NADCAP – National Aerospace and Defense Contractors Accreditation', 'NADCAP', 'Luftfahrt / Akkreditierung', 'Sonderverfahren', 'NADCAP-Akkreditierung für Sonderverfahren (Schweißen, Wärmebehandlung, NDT, Beschichtungen, Composites, Elektronik)', 'Fertigungsverfahren je nach Produktspektrum', 'Produktion, QM', 'Fertigungsleiter / Qualitätsmanager', 'Prüfen welche NADCAP-Kategorien kundenseitig gefordert werden; Akkreditierung beantragen', 'QM-NADCAP-001', 'Zu prüfen', '31.12.2025', '2026-03-10', 'Kundenanforderungen je Projekt prüfen', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(48, '5.13', 'Cybersicherheit Luftfahrt – EASA Part-IS / ED-202A / DO-326A', 'EASA-IS / DO-326A', 'Luftfahrt / Cybersicherheit', 'Informationssicherheit Luftfahrt', 'EASA Part-IS: Cybersicherheitspflichten für Organisationen; DO-326A/ED-202A: IS-Risikobeurteilung Flugzeugsysteme; AMC 20-42', 'Vernetzte Luftfahrtkomponenten, Software, Steuerungssysteme', 'IT, Entwicklung, CISO', 'CISO / Entwicklungsleiter', 'IS-Risikobeurteilung für Luftfahrtprodukte, Security-by-Design, Koordination mit ISMS', 'ISM-AV-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', 'Synergie mit ISO 27001 / NIS-2 nutzen; EASA-Leitlinien konsultieren', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(49, '5.14', 'Produkthaftung Luftfahrt – ProdHaftG / Strict Liability', 'ProdHaftG-Luft', 'Luftfahrt / Recht', 'Produkthaftung', 'Verschärfte Produkthaftung; Dokumentationspflichten 30+ Jahre; Rückverfolgbarkeit jeder Komponente (Serial Number, Batch)', 'Alle gelieferten Luftfahrtkomponenten', 'QM, Recht, Geschäftsführung', 'Qualitätsmanager / Recht', 'Lückenlose Dokumentation (Serialisierung, CoC, Prüfprotokolle), 30-Jahre-Archivierung, Produkthaftpflichtversicherung', 'QM-HAFT-001', 'In Umsetzung', '31.12.2025', '2026-03-10', 'Versicherungsschutz und Deckungssumme prüfen', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL),
(50, '5.15', 'EASA Part 145 / Air OPS – Betriebliche Anforderungen', 'Air OPS', 'Luftfahrt / Regulatorisch', 'Betriebliche Anforderungen', 'Falls Komponenten für Betreiber (Airlines) geliefert: Air-OPS-Anforderungen können technische Spezifikationen beeinflussen; ETOPS, MEL', 'Bauteile für Airlinekunden (Ersatzteile, LRUs)', 'Entwicklung, Vertrieb', 'Entwicklungsleiter', 'Technische Spezifikationen auf Air-OPS-Konformität prüfen, Kundenvorgaben beachten', 'QM-AIROPS-001', 'Zu prüfen', '31.12.2025', '2026-03-10', 'Je nach Kundenanforderung', NULL, '2026-03-10', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Risiko`
--

CREATE TABLE `Risiko` (
  `id` int(11) UNSIGNED NOT NULL,
  `Nummer` varchar(64) DEFAULT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `Besitzer` int(11) UNSIGNED DEFAULT 0,
  `Abteilung` varchar(64) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `Businessimpact` text DEFAULT NULL,
  `Beschreibung` text DEFAULT NULL,
  `Kategorie` varchar(64) DEFAULT NULL,
  `Maßnahme` text DEFAULT NULL,
  `wahrvm` int(11) NOT NULL DEFAULT 1,
  `auswvm` int(11) NOT NULL DEFAULT 1,
  `wahrnm` int(11) NOT NULL DEFAULT 1,
  `auswnm` int(11) NOT NULL DEFAULT 1,
  `Ersteller` int(11) NOT NULL DEFAULT 0,
  `Erstelldatum` date NOT NULL DEFAULT current_timestamp(),
  `Behandlung` varchar(64) DEFAULT NULL,
  `umgesetzt` tinyint(1) NOT NULL DEFAULT 0,
  `Aenderer` int(11) NOT NULL DEFAULT 0,
  `geaendert` date NOT NULL DEFAULT current_timestamp(),
  `Reviewer` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `review` date NOT NULL DEFAULT current_timestamp(),
  `risiko` varchar(64) DEFAULT NULL,
  `massnahmen` varchar(256) DEFAULT NULL,
  `assets` varchar(256) DEFAULT NULL,
  `archiviert` tinyint(1) NOT NULL DEFAULT 0,
  `ra` varchar(255) DEFAULT NULL,
  `riskscore` int(11) NOT NULL DEFAULT 0,
  `bedrohungen` varchar(255) DEFAULT NULL,
  `schwachstellen` varchar(255) DEFAULT NULL,
  `ausw_vm_detail` varchar(20) DEFAULT NULL COMMENT 'Auswirkung vm je Faktor, kommasepariert (vm0,vm1,vm2,vm3,vm4)',
  `ausw_nm_detail` varchar(20) DEFAULT NULL COMMENT 'Auswirkung nm je Faktor, kommasepariert (nm0,nm1,nm2,nm3,nm4)',
  `dokumente` text DEFAULT NULL COMMENT 'Kommagetrennte IDs verknüpfter Dokumente (aus Tabelle Dokumente)',
  `normen` varchar(256) DEFAULT NULL COMMENT 'Kommagetrennte IDs verknüpfter Normen/Controls (aus Tabelle Normen)',
  `Name_en` text DEFAULT NULL,
  `Beschreibung_en` text DEFAULT NULL,
  `Businessimpact_en` text DEFAULT NULL,
  `Maßnahme_en` text DEFAULT NULL,
  `abteilung_id` int(11) DEFAULT NULL,
  `lieferanten` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Risiko_historie`
--

CREATE TABLE `Risiko_historie` (
  `id` int(11) UNSIGNED NOT NULL,
  `risiko_id` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `wahrvm` int(11) NOT NULL DEFAULT 1,
  `auswvm` int(11) NOT NULL DEFAULT 1,
  `wahrnm` int(11) NOT NULL DEFAULT 1,
  `auswnm` int(11) NOT NULL DEFAULT 1,
  `Behandlung` varchar(64) DEFAULT NULL,
  `umgesetzt` tinyint(1) NOT NULL DEFAULT 0,
  `Aenderer` int(11) NOT NULL DEFAULT 0,
  `geaendert` date NOT NULL DEFAULT current_timestamp(),
  `risiko` varchar(64) DEFAULT NULL,
  `riskscore` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `Risiko_historie`
--

INSERT INTO `Risiko_historie` (`id`, `risiko_id`, `status`, `wahrvm`, `auswvm`, `wahrnm`, `auswnm`, `Behandlung`, `umgesetzt`, `Aenderer`, `geaendert`, `risiko`, `riskscore`) VALUES
(26, 23, 'umgesetzt', 3, 4, 1, 3, 'Akzeptieren', 0, 1, '2026-07-06', 'niedrig', 3),
(27, 23, 'Bewertet', 3, 4, 1, 3, 'Akzeptieren', 0, 1, '2026-07-06', 'hoch', 12),
(28, 23, 'umgesetzt', 3, 4, 1, 3, 'Akzeptieren', 0, 1, '2026-07-06', 'hoch', 12),
(29, 23, 'umgesetzt', 3, 4, 1, 3, 'Reduzieren', 0, 1, '2026-07-06', 'niedrig', 3),
(30, 24, 'umgesetzt', 2, 5, 1, 2, 'Reduzieren', 0, 1, '2026-07-13', 'niedrig', 2),
(31, 47, 'Bewertet', 3, 4, 1, 2, 'nicht bewertet', 0, 1, '2026-07-15', 'hoch', 12),
(32, 24, 'umgesetzt', 2, 5, 1, 2, 'Reduzieren', 0, 1, '2026-07-15', 'niedrig', 2),
(33, 48, 'Bewertet', 4, 4, 1, 2, 'nicht bewertet', 0, 1, '2026-07-15', 'hoch', 16),
(34, 20, 'Nicht bewertet', 3, 4, 1, 4, 'Reduzieren', 0, 1, '2026-07-16', 'hoch', 12),
(35, 19, 'Nicht bewertet', 1, 2, 1, 1, 'Reduzieren', 0, 1, '2026-07-16', 'niedrig', 2),
(36, 18, 'behandelt', 2, 3, 1, 3, 'Reduzieren', 0, 1, '2026-07-23', 'niedrig', 3),
(37, 17, 'behandelt', 2, 3, 1, 3, 'Reduzieren', 0, 1, '2026-07-24', 'niedrig', 3),
(38, 47, 'Nicht bewertet', 1, 1, 1, 1, 'nicht bewertet', 0, 1, '2026-07-24', 'niedrig', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `risiko_kategorie`
--

CREATE TABLE `risiko_kategorie` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `risiko_kategorie`
--

INSERT INTO `risiko_kategorie` (`id`, `name`) VALUES
(1, 'Technische Risiken'),
(2, 'Organisatorische Risiken'),
(3, 'Personenbezogene Risiken'),
(4, 'Physische Risiken'),
(5, 'Rechtliche und regulatorische Risiken'),
(6, 'Betriebliche Risiken'),
(7, 'Externe Risiken / Umweltrisiken'),
(8, 'Strategische Risiken');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `risiko_score`
--

CREATE TABLE `risiko_score` (
  `id` int(10) UNSIGNED NOT NULL,
  `risiko` varchar(64) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `risiko_score`
--

INSERT INTO `risiko_score` (`id`, `risiko`, `score`) VALUES
(1, 'nicht bewertet', 0),
(2, 'niedrig', 5),
(3, 'mittel', 10),
(4, 'hoch', 20),
(5, 'kritisch', 255);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `risiko_score_historie`
--

CREATE TABLE `risiko_score_historie` (
  `id` int(11) NOT NULL,
  `datum` date NOT NULL,
  `score_offen` decimal(5,1) DEFAULT NULL,
  `score_alle` decimal(5,1) DEFAULT NULL,
  `score_vendor` decimal(5,1) DEFAULT NULL,
  `n_offen` int(11) DEFAULT 0,
  `n_alle` int(11) DEFAULT 0,
  `n_vendor` int(11) DEFAULT 0,
  `erstellt_am` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `risiko_status`
--

CREATE TABLE `risiko_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `risiko_status`
--

INSERT INTO `risiko_status` (`id`, `status`) VALUES
(1, 'Nicht bewertet'),
(2, 'in Bewertung'),
(3, 'Bewertet'),
(4, 'benötigt Neubewertung'),
(5, 'archiviert'),
(6, 'behandelt'),
(7, 'in Behandlung');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Rollen`
--

CREATE TABLE `Rollen` (
  `id` int(10) UNSIGNED NOT NULL,
  `rolle` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `Rollen`
--

INSERT INTO `Rollen` (`id`, `rolle`) VALUES
(1, 'Administrator'),
(2, 'Informationssicherheitsbeauftragter'),
(3, 'Datenschutzbeauftragter'),
(6, 'Change Manager'),
(8, 'Security Manager'),
(9, 'System Manager'),
(10, 'Developer'),
(11, 'Servicedesk'),
(26, 'Leitung IT'),
(35, 'Geschäftsführung'),
(36, 'Leitung Personalwesen'),
(38, 'Leitung Finanzwesen'),
(39, 'Leitung Vertrieb');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schwachstellen`
--

CREATE TABLE `schwachstellen` (
  `id` int(11) NOT NULL,
  `art` varchar(25) DEFAULT NULL,
  `name` varchar(53) DEFAULT NULL,
  `beschreibung` varchar(84) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Daten für Tabelle `schwachstellen`
--

INSERT INTO `schwachstellen` (`id`, `art`, `name`, `beschreibung`) VALUES
(1, 'Organisation & Governance', 'Fehlende Sicherheitsrichtlinien', 'Es existieren keine oder unvollständige Informationssicherheitsrichtlinien'),
(2, 'Organisation & Governance', 'Unklare Verantwortlichkeiten', 'Rollen und Zuständigkeiten für Informationssicherheit sind nicht eindeutig definiert'),
(3, 'Organisation & Governance', 'Fehlende Risikoanalyse', 'Risiken werden nicht systematisch identifiziert oder bewertet'),
(4, 'Organisation & Governance', 'Unzureichendes Management-Commitment', 'Informationssicherheit wird nicht ausreichend unterstützt oder gesteuert'),
(5, 'Organisation & Governance', 'Fehlende Schulungsprogramme', 'Mitarbeitende sind nicht ausreichend sensibilisiert'),
(6, 'Personal', 'Unzureichende Sicherheitsawareness', 'Mitarbeitende erkennen Sicherheitsrisiken nicht oder handeln unsicher'),
(7, 'Personal', 'Fehlende Verpflichtung auf Vertraulichkeit', 'Keine oder unzureichende Vertraulichkeitsvereinbarungen'),
(8, 'Personal', 'Unzureichender On-/Offboarding-Prozess', 'Berechtigungen werden nicht korrekt vergeben oder entzogen'),
(9, 'Personal', 'Fehlende Vertretungsregelungen', 'Abhängigkeit von einzelnen Personen'),
(10, 'Personal', 'Unzureichende Hintergrundprüfung', 'Sicherheitsrelevante Prüfungen fehlen'),
(11, 'Zugriffskontrolle', 'Fehlende Multi-Faktor-Authentisierung', 'Zugriffe sind nur durch Benutzername/Passwort geschützt'),
(12, 'Zugriffskontrolle', 'Zu weitreichende Berechtigungen', 'Benutzer haben mehr Rechte als erforderlich'),
(13, 'Zugriffskontrolle', 'Gemeinsam genutzte Benutzerkonten', 'Keine eindeutige Benutzerzuordnung'),
(14, 'Zugriffskontrolle', 'Fehlende regelmäßige Rechteüberprüfung', 'Berechtigungen werden nicht regelmäßig geprüft'),
(15, 'Zugriffskontrolle', 'Unzureichende Passwortregeln', 'Schwache oder wiederverwendete Passwörter'),
(16, 'Technik & Systeme', 'Veraltete Systeme', 'Systeme oder Software werden nicht mehr unterstützt'),
(17, 'Technik & Systeme', 'Fehlendes Patch-Management', 'Sicherheitsupdates werden nicht zeitnah eingespielt'),
(18, 'Technik & Systeme', 'Unsichere Systemkonfiguration', 'Standards fehlen oder werden nicht eingehalten'),
(19, 'Technik & Systeme', 'Fehlende Protokollierung', 'Sicherheitsrelevante Ereignisse werden nicht geloggt'),
(20, 'Technik & Systeme', 'Unzureichende Malware-Schutzmaßnahmen', 'Kein oder veralteter Schutz vor Schadsoftware'),
(21, 'Technik & Systeme', 'Fehlende Systemhärtung', 'Unnötige Dienste oder Schnittstellen sind aktiv'),
(22, 'Technik & Systeme', 'Single Point of Failure', 'Keine Redundanz kritischer Komponenten'),
(23, 'Netzwerk & Kommunikation', 'Unzureichende Netzsegmentierung', 'Kritische Systeme sind nicht getrennt'),
(24, 'Netzwerk & Kommunikation', 'Fehlende Verschlüsselung', 'Daten werden unverschlüsselt übertragen oder gespeichert'),
(25, 'Netzwerk & Kommunikation', 'Unsichere Fernzugriffe', 'Remote-Zugriffe sind unzureichend abgesichert'),
(26, 'Netzwerk & Kommunikation', 'Fehlende Firewall-Regelnprüfung', 'Regeln sind veraltet oder zu weit gefasst'),
(27, 'Netzwerk & Kommunikation', 'Unzureichender Schutz vor Angriffen', 'Keine oder unzureichende Intrusion-Detection/-Prevention'),
(28, 'Betrieb & Wartung', 'Fehlende Datensicherung', 'Backups werden nicht oder unzureichend durchgeführt'),
(29, 'Betrieb & Wartung', 'Unzureichende Wiederherstellungstests', 'Backups werden nicht regelmäßig getestet'),
(30, 'Betrieb & Wartung', 'Fehlende Notfallpläne', 'Keine dokumentierten Notfall- oder Wiederanlaufkonzepte'),
(31, 'Betrieb & Wartung', 'Unzureichendes Monitoring', 'Störungen oder Angriffe werden nicht rechtzeitig erkannt'),
(32, 'Betrieb & Wartung', 'Unkontrollierte Änderungen', 'Änderungen erfolgen ohne Freigabe oder Dokumentation'),
(33, 'Lieferanten & Cloud', 'Unzureichende Sicherheitsanforderungen an Lieferanten', 'Sicherheitsanforderungen sind nicht vertraglich geregelt'),
(34, 'Lieferanten & Cloud', 'Fehlende Lieferantenbewertung', 'Sicherheitsniveau von Dienstleistern wird nicht geprüft'),
(35, 'Lieferanten & Cloud', 'Unklare Verantwortlichkeiten bei Cloud-Diensten', 'Shared-Responsibility-Modell ist nicht definiert'),
(36, 'Lieferanten & Cloud', 'Fehlende SLA/Sicherheitsvereinbarungen', 'Vertragliche Regelungen zu Verfügbarkeit und Sicherheit fehlen'),
(37, 'Lieferanten & Cloud', 'Unzureichende Überwachung von Dienstleistern', 'Kontrollen und Reviews fehlen'),
(38, 'Physische Sicherheit', 'Unzureichende Zutrittskontrolle', 'Unbefugte können Gebäude oder Serverräume betreten'),
(39, 'Physische Sicherheit', 'Fehlender Schutz vor Umwelteinflüssen', 'Kein ausreichender Brand-, Wasser- oder Klimaschutz'),
(40, 'Physische Sicherheit', 'Unsichere Aufbewahrung von Datenträgern', 'Datenträger sind ungeschützt zugänglich'),
(41, 'Physische Sicherheit', 'Fehlende Besucherregelungen', 'Besucher werden nicht kontrolliert oder begleitet'),
(42, 'Physische Sicherheit', 'Unzureichende Entsorgung von Datenträgern', 'Daten können rekonstruiert werden');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schwachstelle_kategorie`
--

CREATE TABLE `schwachstelle_kategorie` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Daten für Tabelle `schwachstelle_kategorie`
--

INSERT INTO `schwachstelle_kategorie` (`id`, `name`) VALUES
(1, 'Betrieb & Wartung'),
(2, 'Datenschutz & Compliance'),
(3, 'Lieferanten & Cloud'),
(4, 'Lieferanten & Dritte'),
(5, 'Netzwerk & Infrastruktur'),
(6, 'Netzwerk & Kommunikation'),
(7, 'Organisation & Governance'),
(8, 'Personal'),
(9, 'Physische Sicherheit'),
(10, 'Sonstiges'),
(11, 'Technik & Systeme'),
(12, 'Zugriffskontrolle');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `smtp_settings`
--

CREATE TABLE `smtp_settings` (
  `id` int(11) NOT NULL,
  `smtp_host` varchar(255) NOT NULL DEFAULT '',
  `smtp_port` int(11) NOT NULL DEFAULT 587,
  `smtp_user` varchar(255) NOT NULL DEFAULT '',
  `smtp_pass` varchar(255) NOT NULL DEFAULT '',
  `smtp_tls` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=STARTTLS, 2=SSL, 0=plain',
  `smtp_ssl` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=direktes SSL/SMTPS (Port 465)',
  `from_addr` varchar(255) NOT NULL DEFAULT '',
  `from_name` varchar(255) NOT NULL DEFAULT 'WolfISMS',
  `aktiv` tinyint(1) NOT NULL DEFAULT 0,
  `geaendert` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sql_console_log`
--

CREATE TABLE `sql_console_log` (
  `id` int(11) NOT NULL,
  `ts` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `stmt_type` varchar(20) NOT NULL,
  `sql_text` mediumtext NOT NULL,
  `success` tinyint(1) NOT NULL DEFAULT 0,
  `row_count` int(11) DEFAULT NULL,
  `error_text` text DEFAULT NULL,
  `duration_ms` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Stammdaten`
--

CREATE TABLE `Stammdaten` (
  `Nummer` int(11) NOT NULL,
  `Art` text CHARACTER SET utf16 COLLATE utf16_german2_ci NOT NULL,
  `Bezeichnung` text CHARACTER SET utf16 COLLATE utf16_german2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Vorname` varchar(80) NOT NULL,
  `Nachname` varchar(80) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT 1,
  `master` tinyint(1) NOT NULL DEFAULT 0,
  `assets` tinyint(1) NOT NULL DEFAULT 0,
  `dok` tinyint(1) NOT NULL DEFAULT 0,
  `mass` tinyint(1) NOT NULL DEFAULT 0,
  `risk` tinyint(1) NOT NULL DEFAULT 0,
  `vendor` tinyint(1) NOT NULL DEFAULT 0,
  `audit` tinyint(1) NOT NULL DEFAULT 0,
  `abteilung` varchar(80) DEFAULT NULL,
  `norm` tinyint(1) NOT NULL DEFAULT 0,
  `pers` tinyint(1) NOT NULL DEFAULT 0,
  `sso_provider` varchar(20) DEFAULT NULL,
  `sso_sub` varchar(255) DEFAULT NULL,
  `aufgabe` varchar(255) DEFAULT NULL,
  `persnr` varchar(11) DEFAULT NULL,
  `lang` varchar(2) NOT NULL DEFAULT 'de',
  `dok_read` varchar(1024) DEFAULT ' ',
  `dok_date` date DEFAULT NULL,
  `play` tinyint(1) NOT NULL DEFAULT 0,
  `incidents` tinyint(1) DEFAULT 0,
  `bcm` tinyint(4) DEFAULT 0,
  `custom` tinyint(4) DEFAULT 0,
  `rolle` varchar(50) DEFAULT NULL,
  `totp_secret` varchar(64) DEFAULT NULL,
  `totp_active` tinyint(1) NOT NULL DEFAULT 0,
  `kontakte` tinyint(4) DEFAULT 0,
  `ziele` tinyint(4) DEFAULT 0,
  `aktiv` tinyint(1) NOT NULL DEFAULT 1,
  `abteilung_id` int(11) DEFAULT NULL,
  `no_mail` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vendor`
--

CREATE TABLE `vendor` (
  `id` int(10) UNSIGNED NOT NULL,
  `nummer` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `personendaten` int(10) UNSIGNED DEFAULT 0,
  `vertrag` int(10) UNSIGNED DEFAULT 0,
  `recht` int(10) UNSIGNED DEFAULT 0,
  `zert` int(10) UNSIGNED DEFAULT 0,
  `sicher` int(10) UNSIGNED DEFAULT 0,
  `status` varchar(255) DEFAULT NULL,
  `typ` int(11) DEFAULT NULL,
  `tier` int(10) UNSIGNED DEFAULT 0,
  `besitzer` int(10) UNSIGNED DEFAULT 0,
  `Ersteller` int(10) UNSIGNED NOT NULL,
  `erstellt` date NOT NULL DEFAULT current_timestamp(),
  `Änderer` int(10) UNSIGNED DEFAULT 0,
  `geändert` date NOT NULL DEFAULT current_timestamp(),
  `fragebogen` int(11) DEFAULT 0,
  `Ansprechpartner` varchar(256) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `Reviewer` int(11) NOT NULL DEFAULT 0,
  `review` date NOT NULL DEFAULT current_timestamp(),
  `schutz` int(10) UNSIGNED DEFAULT 0,
  `risiko` varchar(16) DEFAULT NULL,
  `frueher` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `massnahmen` varchar(256) DEFAULT NULL,
  `risikoscore` decimal(11,0) DEFAULT 0,
  `typ_old` varchar(255) DEFAULT NULL,
  `assets` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vendor_anhaenge`
--

CREATE TABLE `vendor_anhaenge` (
  `id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `stored_name` varchar(255) NOT NULL,
  `rel_path` varchar(255) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `file_size` int(11) NOT NULL,
  `beschreibung` varchar(255) DEFAULT NULL,
  `ersteller` int(11) DEFAULT NULL,
  `erstellt` date NOT NULL,
  `aenderer` int(11) DEFAULT NULL,
  `geaendert` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vendor_gewichte`
--

CREATE TABLE `vendor_gewichte` (
  `id` int(10) UNSIGNED NOT NULL,
  `bereich` varchar(32) NOT NULL,
  `parameter` varchar(64) NOT NULL,
  `bezeichnung` varchar(128) NOT NULL,
  `wert_ja` tinyint(4) NOT NULL DEFAULT 0,
  `wert_teilweise` tinyint(4) NOT NULL DEFAULT 2,
  `wert_nein` tinyint(4) NOT NULL DEFAULT 5,
  `reihenfolge` tinyint(4) NOT NULL DEFAULT 0,
  `bezeichnung_en` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `vendor_gewichte`
--

INSERT INTO `vendor_gewichte` (`id`, `bereich`, `parameter`, `bezeichnung`, `wert_ja`, `wert_teilweise`, `wert_nein`, `reihenfolge`, `bezeichnung_en`) VALUES
(1, 'vendor_eintritt', 'zert', 'Zertifizierung vorhanden? (ISO 27001, SOC2 etc.)', 0, 2, 5, 1, NULL),
(2, 'vendor_eintritt', 'frage', 'Sicherheitsfragebogen ausgefüllt?', 0, 2, 5, 2, NULL),
(3, 'vendor_eintritt', 'vertrag', 'Vertragliche Regelung / AVV vorhanden?', 0, 2, 5, 3, NULL),
(4, 'vendor_eintritt', 'frueher', 'Früherer Sicherheitsvorfall beim Lieferanten?', 0, 2, 5, 4, NULL),
(5, 'vendor_schaden', 'pers', 'Verarbeitung personenbezogener Daten (DSGVO)?', 5, 2, 0, 1, NULL),
(6, 'vendor_schaden', 'schutz', 'Hoher Schutzbedarf der Systeme / Daten?', 5, 2, 0, 2, NULL),
(7, 'vendor_schaden', 'tier', 'Tier-Kritikalität (1=unkritisch, 3=kritisch)', 5, 4, 2, 3, NULL),
(8, 'vendor_schaden', 'recht', 'Rechtliche / Compliance-Anforderungen verletzt?', 5, 2, 0, 4, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vendor_historie`
--

CREATE TABLE `vendor_historie` (
  `id` int(10) UNSIGNED NOT NULL,
  `vendor_id` int(10) UNSIGNED NOT NULL,
  `eintritt` int(11) NOT NULL,
  `schaden` int(11) NOT NULL,
  `riskscore` int(11) NOT NULL,
  `datum` date NOT NULL DEFAULT current_timestamp(),
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vendor_kurzbewertung`
--

CREATE TABLE `vendor_kurzbewertung` (
  `id` int(10) UNSIGNED NOT NULL,
  `kurzbewertung` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `vendor_kurzbewertung`
--

INSERT INTO `vendor_kurzbewertung` (`id`, `kurzbewertung`) VALUES
(1, 'Ja'),
(2, 'Nein'),
(3, 'Teilweise'),
(4, 'N/A');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vendor_status`
--

CREATE TABLE `vendor_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `vendor_status`
--

INSERT INTO `vendor_status` (`id`, `status`) VALUES
(1, 'Aktiv'),
(2, 'Onboarding'),
(3, 'Inaktiv'),
(4, 'Offboarding'),
(5, 'Evaluierung');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vendor_tier`
--

CREATE TABLE `vendor_tier` (
  `id` int(10) UNSIGNED NOT NULL,
  `tier` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `vendor_tier`
--

INSERT INTO `vendor_tier` (`id`, `tier`) VALUES
(1, 'unwesentlich'),
(2, 'wesentlich'),
(3, 'geschäftskritisch'),
(4, 'missionskritisch');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vendor_typ`
--

CREATE TABLE `vendor_typ` (
  `id` int(10) UNSIGNED NOT NULL,
  `Typ` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `vendor_typ`
--

INSERT INTO `vendor_typ` (`id`, `Typ`) VALUES
(1, 'Dienstleister'),
(2, 'Softwareanbieter'),
(3, 'Cloud Anbieter'),
(4, 'Andere'),
(5, 'Hardwareanbieter'),
(6, 'Telekommunikation');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ziele_kpi`
--

CREATE TABLE `ziele_kpi` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `beschreibung` text DEFAULT NULL,
  `einheit` varchar(50) DEFAULT NULL,
  `zielwert` decimal(14,2) DEFAULT NULL,
  `richtung` varchar(20) NOT NULL DEFAULT 'hoeher_besser',
  `sortierung` int(11) NOT NULL DEFAULT 0,
  `ersteller` int(10) UNSIGNED DEFAULT NULL,
  `erstellt_am` datetime NOT NULL DEFAULT current_timestamp(),
  `aenderer` int(10) UNSIGNED DEFAULT NULL,
  `geaendert_am` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `name_en` text DEFAULT NULL,
  `beschreibung_en` text DEFAULT NULL,
  `einheit_en` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ziele_kpi_historie`
--

CREATE TABLE `ziele_kpi_historie` (
  `id` int(10) UNSIGNED NOT NULL,
  `kpi_id` int(10) UNSIGNED NOT NULL,
  `wert` decimal(14,2) NOT NULL,
  `datum` date NOT NULL,
  `kommentar` text DEFAULT NULL,
  `ersteller` int(10) UNSIGNED DEFAULT NULL,
  `erstellt_am` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ziele_texte`
--

CREATE TABLE `ziele_texte` (
  `id` int(10) UNSIGNED NOT NULL,
  `unternehmensziele` text DEFAULT NULL,
  `is_ziele` text DEFAULT NULL,
  `geaendert_von` int(10) UNSIGNED DEFAULT NULL,
  `geaendert_am` datetime DEFAULT NULL,
  `unternehmensziele_en` text DEFAULT NULL,
  `is_ziele_en` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Abteilungen`
--
ALTER TABLE `Abteilungen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_abteilungen_name` (`name`),
  ADD KEY `idx_abteilungen_parent` (`parent_id`),
  ADD KEY `idx_abteilungen_leitung` (`leitung_id`);

--
-- Indizes für die Tabelle `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_key_hash` (`key_hash`);

--
-- Indizes für die Tabelle `Assets`
--
ALTER TABLE `Assets`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `asset_art_pbd`
--
ALTER TABLE `asset_art_pbd`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `art` (`art`);

--
-- Indizes für die Tabelle `asset_betroffene_personen`
--
ALTER TABLE `asset_betroffene_personen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bezeichnung` (`bezeichnung`);

--
-- Indizes für die Tabelle `asset_datenhaltung`
--
ALTER TABLE `asset_datenhaltung`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `datenhaltung` (`datenhaltung`);

--
-- Indizes für die Tabelle `asset_kategorie`
--
ALTER TABLE `asset_kategorie`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `asset_status`
--
ALTER TABLE `asset_status`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `asset_typ`
--
ALTER TABLE `asset_typ`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `typ` (`typ`);

--
-- Indizes für die Tabelle `Audit`
--
ALTER TABLE `Audit`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `AuditCE`
--
ALTER TABLE `AuditCE`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `AuditDSGVO`
--
ALTER TABLE `AuditDSGVO`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `AuditNIS2`
--
ALTER TABLE `AuditNIS2`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `AuditTISAX`
--
ALTER TABLE `AuditTISAX`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `AuditVdS`
--
ALTER TABLE `AuditVdS`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Auswirkung`
--
ALTER TABLE `Auswirkung`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `bcm_bia`
--
ALTER TABLE `bcm_bia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_prozess` (`prozess_id`);

--
-- Indizes für die Tabelle `bcm_notfallplaene`
--
ALTER TABLE `bcm_notfallplaene`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `bcm_prozesse`
--
ALTER TABLE `bcm_prozesse`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `bcm_uebungen`
--
ALTER TABLE `bcm_uebungen`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `bcm_uebung_anhaenge`
--
ALTER TABLE `bcm_uebung_anhaenge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uebung_id` (`uebung_id`);

--
-- Indizes für die Tabelle `bedrohungen`
--
ALTER TABLE `bedrohungen`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `bedrohung_kategorie`
--
ALTER TABLE `bedrohung_kategorie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_bedrohung_kategorie_name` (`name`);

--
-- Indizes für die Tabelle `bericht_art`
--
ALTER TABLE `bericht_art`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `bpmn_dokumente`
--
ALTER TABLE `bpmn_dokumente`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `cron_settings`
--
ALTER TABLE `cron_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_job_key` (`job_key`);

--
-- Indizes für die Tabelle `Dokumente`
--
ALTER TABLE `Dokumente`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `Dokumente` ADD FULLTEXT KEY `ft_titel_text` (`Dokumentenname`,`Text`);

--
-- Indizes für die Tabelle `dok_anhaenge`
--
ALTER TABLE `dok_anhaenge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mass_id` (`dok_id`);

--
-- Indizes für die Tabelle `dok_historie`
--
ALTER TABLE `dok_historie`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `dok_status`
--
ALTER TABLE `dok_status`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `dok_typ`
--
ALTER TABLE `dok_typ`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `dok_typ_en`
--
ALTER TABLE `dok_typ_en`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Gefaehrdungen`
--
ALTER TABLE `Gefaehrdungen`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Incidents`
--
ALTER TABLE `Incidents`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `inc_link`
--
ALTER TABLE `inc_link`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `ismshilfe`
--
ALTER TABLE `ismshilfe`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `isms_settings`
--
ALTER TABLE `isms_settings`
  ADD PRIMARY KEY (`key`);

--
-- Indizes für die Tabelle `klassifizierung`
--
ALTER TABLE `klassifizierung`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `klassifizierung_en`
--
ALTER TABLE `klassifizierung_en`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `kommentare`
--
ALTER TABLE `kommentare`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_komm_obj` (`bereich`,`objekt_id`);

--
-- Indizes für die Tabelle `kontakte_behoerden`
--
ALTER TABLE `kontakte_behoerden`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `kontakte_dienstleister`
--
ALTER TABLE `kontakte_dienstleister`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `kontakte_interessensgruppen`
--
ALTER TABLE `kontakte_interessensgruppen`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `kontakte_kunden`
--
ALTER TABLE `kontakte_kunden`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `kontakte_mitarbeiter`
--
ALTER TABLE `kontakte_mitarbeiter`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `kritikalität`
--
ALTER TABLE `kritikalität`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Links`
--
ALTER TABLE `Links`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Massnahmen`
--
ALTER TABLE `Massnahmen`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `mass_anhaenge`
--
ALTER TABLE `mass_anhaenge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mass_id` (`mass_id`);

--
-- Indizes für die Tabelle `mgmt_review`
--
ALTER TABLE `mgmt_review`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Normen`
--
ALTER TABLE `Normen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_normen_geloescht` (`gelöscht`);

--
-- Indizes für die Tabelle `norm_status`
--
ALTER TABLE `norm_status`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `op_plan`
--
ALTER TABLE `op_plan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_kette` (`kette_id`),
  ADD KEY `idx_aktuell` (`ist_aktuell`);

--
-- Indizes für die Tabelle `Personal`
--
ALTER TABLE `Personal`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `playbooks`
--
ALTER TABLE `playbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Projekte`
--
ALTER TABLE `Projekte`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `pw_reset_tokens`
--
ALTER TABLE `pw_reset_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_pwrt_token` (`token`),
  ADD KEY `idx_pwrt_user` (`user_id`);

--
-- Indizes für die Tabelle `rechtsregister`
--
ALTER TABLE `rechtsregister`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rr_status` (`status`),
  ADD KEY `idx_rr_kuerzel` (`kuerzel`),
  ADD KEY `idx_rr_kategorie` (`kategorie`);

--
-- Indizes für die Tabelle `Risiko`
--
ALTER TABLE `Risiko`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Risiko_historie`
--
ALTER TABLE `Risiko_historie`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `risiko_kategorie`
--
ALTER TABLE `risiko_kategorie`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `risiko_score`
--
ALTER TABLE `risiko_score`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `risiko_score_historie`
--
ALTER TABLE `risiko_score_historie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_datum` (`datum`);

--
-- Indizes für die Tabelle `risiko_status`
--
ALTER TABLE `risiko_status`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Rollen`
--
ALTER TABLE `Rollen`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `schwachstellen`
--
ALTER TABLE `schwachstellen`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `schwachstelle_kategorie`
--
ALTER TABLE `schwachstelle_kategorie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_schwachstelle_kategorie_name` (`name`);

--
-- Indizes für die Tabelle `smtp_settings`
--
ALTER TABLE `smtp_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `sql_console_log`
--
ALTER TABLE `sql_console_log`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Stammdaten`
--
ALTER TABLE `Stammdaten`
  ADD PRIMARY KEY (`Nummer`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indizes für die Tabelle `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `vendor_anhaenge`
--
ALTER TABLE `vendor_anhaenge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indizes für die Tabelle `vendor_gewichte`
--
ALTER TABLE `vendor_gewichte`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_bereich_param` (`bereich`,`parameter`);

--
-- Indizes für die Tabelle `vendor_historie`
--
ALTER TABLE `vendor_historie`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `vendor_kurzbewertung`
--
ALTER TABLE `vendor_kurzbewertung`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `vendor_status`
--
ALTER TABLE `vendor_status`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `vendor_tier`
--
ALTER TABLE `vendor_tier`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `vendor_typ`
--
ALTER TABLE `vendor_typ`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `ziele_kpi`
--
ALTER TABLE `ziele_kpi`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `ziele_kpi_historie`
--
ALTER TABLE `ziele_kpi_historie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_kpi` (`kpi_id`);

--
-- Indizes für die Tabelle `ziele_texte`
--
ALTER TABLE `ziele_texte`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Abteilungen`
--
ALTER TABLE `Abteilungen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1621;

--
-- AUTO_INCREMENT für Tabelle `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `Assets`
--
ALTER TABLE `Assets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT für Tabelle `asset_art_pbd`
--
ALTER TABLE `asset_art_pbd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `asset_betroffene_personen`
--
ALTER TABLE `asset_betroffene_personen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `asset_datenhaltung`
--
ALTER TABLE `asset_datenhaltung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `asset_kategorie`
--
ALTER TABLE `asset_kategorie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT für Tabelle `asset_status`
--
ALTER TABLE `asset_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `asset_typ`
--
ALTER TABLE `asset_typ`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `Audit`
--
ALTER TABLE `Audit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT für Tabelle `AuditCE`
--
ALTER TABLE `AuditCE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT für Tabelle `AuditDSGVO`
--
ALTER TABLE `AuditDSGVO`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT für Tabelle `AuditNIS2`
--
ALTER TABLE `AuditNIS2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT für Tabelle `AuditTISAX`
--
ALTER TABLE `AuditTISAX`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT für Tabelle `AuditVdS`
--
ALTER TABLE `AuditVdS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT für Tabelle `Auswirkung`
--
ALTER TABLE `Auswirkung`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `bcm_bia`
--
ALTER TABLE `bcm_bia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `bcm_notfallplaene`
--
ALTER TABLE `bcm_notfallplaene`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `bcm_prozesse`
--
ALTER TABLE `bcm_prozesse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `bcm_uebungen`
--
ALTER TABLE `bcm_uebungen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `bcm_uebung_anhaenge`
--
ALTER TABLE `bcm_uebung_anhaenge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `bedrohungen`
--
ALTER TABLE `bedrohungen`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT für Tabelle `bedrohung_kategorie`
--
ALTER TABLE `bedrohung_kategorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `bericht_art`
--
ALTER TABLE `bericht_art`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `bpmn_dokumente`
--
ALTER TABLE `bpmn_dokumente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `cron_settings`
--
ALTER TABLE `cron_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `Dokumente`
--
ALTER TABLE `Dokumente`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT für Tabelle `dok_anhaenge`
--
ALTER TABLE `dok_anhaenge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `dok_historie`
--
ALTER TABLE `dok_historie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT für Tabelle `dok_status`
--
ALTER TABLE `dok_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `dok_typ`
--
ALTER TABLE `dok_typ`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `dok_typ_en`
--
ALTER TABLE `dok_typ_en`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `Gefaehrdungen`
--
ALTER TABLE `Gefaehrdungen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT für Tabelle `Incidents`
--
ALTER TABLE `Incidents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `inc_link`
--
ALTER TABLE `inc_link`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `ismshilfe`
--
ALTER TABLE `ismshilfe`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT für Tabelle `klassifizierung`
--
ALTER TABLE `klassifizierung`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `klassifizierung_en`
--
ALTER TABLE `klassifizierung_en`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `kommentare`
--
ALTER TABLE `kommentare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `kontakte_behoerden`
--
ALTER TABLE `kontakte_behoerden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `kontakte_dienstleister`
--
ALTER TABLE `kontakte_dienstleister`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `kontakte_interessensgruppen`
--
ALTER TABLE `kontakte_interessensgruppen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `kontakte_kunden`
--
ALTER TABLE `kontakte_kunden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `kontakte_mitarbeiter`
--
ALTER TABLE `kontakte_mitarbeiter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `kritikalität`
--
ALTER TABLE `kritikalität`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `Links`
--
ALTER TABLE `Links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT für Tabelle `Massnahmen`
--
ALTER TABLE `Massnahmen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT für Tabelle `mass_anhaenge`
--
ALTER TABLE `mass_anhaenge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `mgmt_review`
--
ALTER TABLE `mgmt_review`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `Normen`
--
ALTER TABLE `Normen`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `norm_status`
--
ALTER TABLE `norm_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `op_plan`
--
ALTER TABLE `op_plan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `Personal`
--
ALTER TABLE `Personal`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `playbooks`
--
ALTER TABLE `playbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `Projekte`
--
ALTER TABLE `Projekte`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `pw_reset_tokens`
--
ALTER TABLE `pw_reset_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `rechtsregister`
--
ALTER TABLE `rechtsregister`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT für Tabelle `Risiko`
--
ALTER TABLE `Risiko`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT für Tabelle `Risiko_historie`
--
ALTER TABLE `Risiko_historie`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT für Tabelle `risiko_kategorie`
--
ALTER TABLE `risiko_kategorie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT für Tabelle `risiko_score`
--
ALTER TABLE `risiko_score`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `risiko_score_historie`
--
ALTER TABLE `risiko_score_historie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `risiko_status`
--
ALTER TABLE `risiko_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `Rollen`
--
ALTER TABLE `Rollen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT für Tabelle `schwachstellen`
--
ALTER TABLE `schwachstellen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT für Tabelle `schwachstelle_kategorie`
--
ALTER TABLE `schwachstelle_kategorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `smtp_settings`
--
ALTER TABLE `smtp_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `sql_console_log`
--
ALTER TABLE `sql_console_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT für Tabelle `Stammdaten`
--
ALTER TABLE `Stammdaten`
  MODIFY `Nummer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT für Tabelle `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT für Tabelle `vendor_anhaenge`
--
ALTER TABLE `vendor_anhaenge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT für Tabelle `vendor_gewichte`
--
ALTER TABLE `vendor_gewichte`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `vendor_historie`
--
ALTER TABLE `vendor_historie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `vendor_kurzbewertung`
--
ALTER TABLE `vendor_kurzbewertung`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `vendor_status`
--
ALTER TABLE `vendor_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `vendor_tier`
--
ALTER TABLE `vendor_tier`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `vendor_typ`
--
ALTER TABLE `vendor_typ`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `ziele_kpi`
--
ALTER TABLE `ziele_kpi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `ziele_kpi_historie`
--
ALTER TABLE `ziele_kpi_historie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `ziele_texte`
--
ALTER TABLE `ziele_texte`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
