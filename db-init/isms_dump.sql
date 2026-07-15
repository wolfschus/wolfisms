-- phpMyAdmin SQL Dump
-- version 5.2.3deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 15. Jul 2026 um 12:00
-- Server-Version: 11.8.6-MariaDB-5 from Ubuntu
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
  `cia_quelle` varchar(255) DEFAULT NULL COMMENT 'Comma-separated IDs von CIA-Quell-Assets (Peer-Vererbung)',
  `Authentizität` varchar(255) DEFAULT NULL
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
(1, 'ISMS-Grundlagen und Governance', 'Geltungsbereich (Scope) klar definiert, abgegrenzt und dokumentiert', 0, 1, 'offen', '2026-01-24'),
(2, 'ISMS-Grundlagen und Governance', 'Kontext der Organisation (interne und externe Themen) dokumentiert', 0, 1, 'offen', '2026-01-24'),
(3, 'ISMS-Grundlagen und Governance', 'Interessierte Parteien inkl. Anforderungen identifiziert', 0, 1, 'offen', '2026-01-24'),
(4, 'ISMS-Grundlagen und Governance', 'ISMS-Ziele definiert, messbar und überwacht', 0, 1, 'offen', '2026-01-24'),
(5, 'ISMS-Grundlagen und Governance', 'ISMS-Dokumentationsstruktur nachvollziehbar', 0, 1, 'offen', '2026-01-24'),
(6, 'ISMS-Grundlagen und Governance', 'Rollen und Verantwortlichkeiten (ISMS-Beauftragter etc.) festgelegt', 0, 1, 'offen', '2026-01-24'),
(7, 'ISMS-Grundlagen und Governance', 'Management-Commitment dokumentiert (Policy, Reviews)', 0, 1, 'offen', '2026-01-24'),
(8, 'Informationssicherheitsleitlinie (Policy)', 'Genehmigte Informationssicherheitsleitlinie vorhanden', 0, 1, 'offen', '2026-01-24'),
(9, 'Informationssicherheitsleitlinie (Policy)', 'Versioniert, freigegeben und kommuniziert', 0, 1, 'offen', '2026-01-24'),
(10, 'Informationssicherheitsleitlinie (Policy)', 'Für Mitarbeiter zugänglich', 0, 1, 'offen', '2026-01-24'),
(11, 'Informationssicherheitsleitlinie (Policy)', 'Inhalte konsistent zu Zielen, Risiken und Maßnahmen', 0, 1, 'offen', '2026-01-24'),
(12, 'Informationssicherheitsleitlinie (Policy)', 'Regelmäßige Überprüfung nachweisbar', 0, 1, 'offen', '2026-01-24'),
(13, 'Asset-Management', 'Vollständiges Asset-Verzeichnis (IT, OT, Informationen, Services)', 0, 1, 'offen', '2026-01-24'),
(14, 'Asset-Management', 'Asset-Eigentümer festgelegt', 0, 1, 'offen', '2026-01-24'),
(15, 'Asset-Management', 'Klassifizierung (z. B. Schutzbedarf / CIA) dokumentiert', 0, 1, 'offen', '2026-01-24'),
(16, 'Asset-Management', 'Kritische Abhängigkeiten erfasst', 0, 1, 'offen', '2026-01-24'),
(17, 'Risikomanagement', 'Risikomanagement-Methode dokumentiert', 0, 1, 'offen', '2026-01-24'),
(18, 'Risikomanagement', 'Schutzbedarf / CIA-Bewertung nachvollziehbar', 0, 1, 'offen', '2026-01-24'),
(19, 'Risikomanagement', 'Risiken identifiziert (vollständig & realistisch)', 0, 1, 'offen', '2026-01-24'),
(20, 'Risikomanagement', 'Risikobewertung konsistent angewendet', 0, 1, 'offen', '2026-01-24'),
(21, 'Risikomanagement', 'Risikobehandlungsplan vorhanden', 0, 1, 'offen', '2026-01-24'),
(22, 'Risikomanagement', 'Restrisiken akzeptiert (Management-Freigabe)', 0, 1, 'offen', '2026-01-24'),
(23, 'Risikomanagement', 'Regelmäßige Neubewertung nachweisbar', 0, 1, 'offen', '2026-01-24'),
(24, 'Statement of Applicability (SoA)', 'Alle Annex-A-Controls berücksichtigt', 0, 1, 'offen', '2026-01-24'),
(25, 'Statement of Applicability (SoA)', 'Umsetzung je Control beschrieben', 0, 1, 'offen', '2026-01-24'),
(26, 'Statement of Applicability (SoA)', 'Verknüpfung zu Maßnahmen / Dokumenten vorhanden', 0, 1, 'offen', '2026-01-24'),
(27, 'Statement of Applicability (SoA)', 'Version & Freigabe dokumentiert', 0, 1, 'offen', '2026-01-24'),
(28, 'Richtlinien und Konzepte (Policies)', 'Zugriffs- und Berechtigungskonzept', 0, 1, 'offen', '2026-01-24'),
(29, 'Richtlinien und Konzepte (Policies)', 'Passwort- / Authentifizierungskonzept', 0, 1, 'offen', '2026-01-24'),
(30, 'Richtlinien und Konzepte (Policies)', 'Backup- und Wiederherstellungskonzept', 0, 1, 'offen', '2026-01-24'),
(31, 'Richtlinien und Konzepte (Policies)', 'Logging- und Monitoring-Konzept', 0, 1, 'offen', '2026-01-24'),
(32, 'Richtlinien und Konzepte (Policies)', 'Incident-Management-Richtlinie', 0, 1, 'offen', '2026-01-24'),
(33, 'Richtlinien und Konzepte (Policies)', 'Lieferanten- / Dienstleisterrichtlinie', 0, 1, 'offen', '2026-01-24'),
(34, 'Richtlinien und Konzepte (Policies)', 'Schulungs- und Awareness-Konzept', 0, 1, 'offen', '2026-01-24'),
(35, 'Richtlinien und Konzepte (Policies)', 'Alle Richtlinien: versioniert, freigegeben, aktuell, bekanntgemacht', 0, 1, 'offen', '2026-01-24'),
(36, 'Operative Umsetzung (Wirksamkeit!)', 'Benutzer- und Rollenverwaltung technisch umgesetzt', 0, 1, 'offen', '2026-01-24'),
(37, 'Operative Umsetzung (Wirksamkeit!)', 'Least-Privilege nachweisbar', 0, 1, 'offen', '2026-01-24'),
(38, 'Operative Umsetzung (Wirksamkeit!)', 'Logging aktiv und ausgewertet', 0, 1, 'offen', '2026-01-24'),
(39, 'Operative Umsetzung (Wirksamkeit!)', 'Backups getestet (Restore-Nachweise!)', 0, 1, 'offen', '2026-01-24'),
(40, 'Operative Umsetzung (Wirksamkeit!)', 'Patch- und Update-Prozess dokumentiert', 0, 1, 'offen', '2026-01-24'),
(41, 'Operative Umsetzung (Wirksamkeit!)', 'Schutzmaßnahmen nicht nur beschrieben, sondern aktiv', 0, 1, 'offen', '2026-01-24'),
(42, 'Incident- und Ereignismanagement', 'Definition von Sicherheitsvorfällen', 0, 1, 'offen', '2026-01-24'),
(43, 'Incident- und Ereignismanagement', 'Meldewege und Eskalation geregelt', 0, 1, 'offen', '2026-01-24'),
(44, 'Incident- und Ereignismanagement', 'Incident-Register vorhanden', 0, 1, 'offen', '2026-01-24'),
(45, 'Incident- und Ereignismanagement', 'Bearbeitung und Lessons Learned dokumentiert', 0, 1, 'offen', '2026-01-24'),
(46, 'Incident- und Ereignismanagement', 'Testfälle oder reale Incidents vorhanden', 0, 1, 'offen', '2026-01-24'),
(47, 'Incident- und Ereignismanagement', 'Verbindung zu Risiken und Maßnahmen', 0, 1, 'offen', '2026-01-24'),
(48, 'Lieferanten- und Dienstleistermanagement', 'Relevante Lieferanten identifiziert', 0, 1, 'offen', '2026-01-24'),
(49, 'Lieferanten- und Dienstleistermanagement', 'Sicherheitsanforderungen definiert', 0, 1, 'offen', '2026-01-24'),
(50, 'Lieferanten- und Dienstleistermanagement', 'Risiko-Bewertung je Lieferant', 0, 1, 'offen', '2026-01-24'),
(51, 'Lieferanten- und Dienstleistermanagement', 'Verträge / AVV / SLAs vorhanden', 0, 1, 'offen', '2026-01-24'),
(52, 'Lieferanten- und Dienstleistermanagement', 'Regelmäßige Überprüfung dokumentiert', 0, 1, 'offen', '2026-01-24'),
(53, 'Schulung und Awareness', 'Schulungskonzept dokumentiert', 0, 1, 'offen', '2026-01-24'),
(54, 'Schulung und Awareness', 'Pflichtschulungen definiert', 0, 1, 'offen', '2026-01-24'),
(55, 'Schulung und Awareness', 'Teilnahme nachweisbar', 0, 1, 'offen', '2026-01-24'),
(56, 'Schulung und Awareness', 'Neue Mitarbeiter geschult', 0, 1, 'offen', '2026-01-24'),
(57, 'Schulung und Awareness', 'Regelmäßige Wiederholungen', 0, 1, 'offen', '2026-01-24'),
(58, 'Schulung und Awareness', 'Awareness-Maßnahmen dokumentiert', 0, 1, 'offen', '2026-01-24'),
(59, 'Überwachung, Messung und KPIs', 'ISMS-Kennzahlen definiert', 0, 1, 'offen', '2026-01-24'),
(60, 'Überwachung, Messung und KPIs', 'Messungen regelmäßig durchgeführt', 0, 1, 'offen', '2026-01-24'),
(61, 'Überwachung, Messung und KPIs', 'Abweichungen dokumentiert', 0, 1, 'offen', '2026-01-24'),
(62, 'Überwachung, Messung und KPIs', 'Maßnahmen abgeleitet', 0, 1, 'offen', '2026-01-24'),
(63, 'Überwachung, Messung und KPIs', 'Trends erkennbar', 0, 1, 'offen', '2026-01-24'),
(64, 'Interne Audits', 'Audit-Programm vorhanden', 0, 1, 'offen', '2026-01-24'),
(65, 'Interne Audits', 'Auditor unabhängig', 0, 1, 'offen', '2026-01-24'),
(66, 'Interne Audits', 'Auditberichte dokumentiert', 0, 1, 'offen', '2026-01-24'),
(67, 'Interne Audits', 'Abweichungen klassifiziert', 0, 1, 'offen', '2026-01-24'),
(68, 'Interne Audits', 'Korrekturmaßnahmen umgesetzt', 0, 1, 'offen', '2026-01-24'),
(69, 'Interne Audits', 'Wirksamkeitsprüfung erfolgt', 0, 1, 'offen', '2026-01-24'),
(70, 'Management-Review', 'Regelmäßig durchgeführt', 0, 1, 'offen', '2026-01-24'),
(71, 'Management-Review', 'Alle Pflichtinputs enthalten', 0, 1, 'offen', '2026-01-24'),
(72, 'Management-Review', 'Entscheidungen & Maßnahmen dokumentiert', 0, 1, 'offen', '2026-01-24'),
(73, 'Management-Review', 'Ressourcenfreigaben erkennbar', 0, 1, 'offen', '2026-01-24'),
(74, 'Management-Review', 'Follow-up nachweisbar', 0, 1, 'offen', '2026-01-24'),
(75, 'Korrektur- und Verbesserungsmaßnahmen', 'Abweichungen dokumentiert', 0, 1, 'offen', '2026-01-24'),
(76, 'Korrektur- und Verbesserungsmaßnahmen', 'Ursachenanalyse durchgeführt', 0, 1, 'offen', '2026-01-24'),
(77, 'Korrektur- und Verbesserungsmaßnahmen', 'Maßnahmen definiert', 0, 1, 'offen', '2026-01-24'),
(78, 'Korrektur- und Verbesserungsmaßnahmen', 'Verantwortliche benannt', 0, 1, 'offen', '2026-01-24'),
(79, 'Korrektur- und Verbesserungsmaßnahmen', 'Fristen gesetzt', 0, 1, 'offen', '2026-01-24'),
(80, 'Korrektur- und Verbesserungsmaßnahmen', 'Wirksamkeit geprüft', 0, 1, 'offen', '2026-01-24'),
(81, 'Dokumenten- und Nachweismanagement', 'Dokumentenlenkung geregelt', 0, 1, 'offen', '2026-01-24'),
(82, 'Dokumenten- und Nachweismanagement', 'Versionierung konsistent', 0, 1, 'offen', '2026-01-24'),
(83, 'Dokumenten- und Nachweismanagement', 'Freigaben nachvollziehbar', 0, 1, 'offen', '2026-01-24'),
(84, 'Dokumenten- und Nachweismanagement', 'Veraltete Dokumente gesperrt', 0, 1, 'offen', '2026-01-24'),
(85, 'Dokumenten- und Nachweismanagement', 'Nachweise schnell auffindbar', 0, 1, 'offen', '2026-01-24');

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
(1, 'Firewalls', 'Eine Firewall oder ein vergleichbares Netzwerk-Boundary-Device ist an allen Internet-Zugangspunkten vorhanden.', 0, 1, 'offen', '2026-05-09'),
(2, 'Firewalls', 'Die Standard-Passwörter aller Firewalls wurden geändert.', 0, 1, 'offen', '2026-05-09'),
(3, 'Firewalls', 'Ungenutzte und nicht benötigte Dienste und Ports sind gesperrt.', 0, 1, 'offen', '2026-05-09'),
(4, 'Firewalls', 'Eingehender Datenverkehr wird auf bekannte, notwendige Quellen beschränkt.', 0, 1, 'offen', '2026-05-09'),
(5, 'Firewalls', 'Die Firewall-Regeln werden regelmäßig überprüft und dokumentiert.', 0, 1, 'offen', '2026-05-09'),
(6, 'Sichere Konfiguration', 'Standard-Passwörter und -Konten werden auf allen Geräten und Diensten geändert oder deaktiviert.', 0, 1, 'offen', '2026-05-09'),
(7, 'Sichere Konfiguration', 'Nicht benötigte Software, Konten und Dienste werden entfernt oder deaktiviert.', 0, 1, 'offen', '2026-05-09'),
(8, 'Sichere Konfiguration', 'Auto-Run-Funktionen für Wechseldatenträger sind deaktiviert.', 0, 1, 'offen', '2026-05-09'),
(9, 'Sichere Konfiguration', 'Systemeinstellungen werden dokumentiert und regelmäßig überprüft.', 0, 1, 'offen', '2026-05-09'),
(10, 'Zugriffskontrolle', 'Benutzerkonten werden nur für autorisierte Personen angelegt und bei Ausscheiden sofort deaktiviert.', 0, 1, 'offen', '2026-05-09'),
(11, 'Zugriffskontrolle', 'Administrative Rechte sind auf das notwendige Minimum beschränkt (Least Privilege).', 0, 1, 'offen', '2026-05-09'),
(12, 'Zugriffskontrolle', 'Administrative Aufgaben werden nicht über Standard-Benutzerkonten durchgeführt.', 0, 1, 'offen', '2026-05-09'),
(13, 'Zugriffskontrolle', 'Multi-Faktor-Authentifizierung (MFA) ist für privilegierte Konten aktiviert.', 0, 1, 'offen', '2026-05-09'),
(14, 'Zugriffskontrolle', 'Passwortrichtlinien erzwingen sichere Passwörter (Länge, Komplexität oder Passphrasen).', 0, 1, 'offen', '2026-05-09'),
(15, 'Schutz vor Schadsoftware', 'Auf allen Endgeräten ist eine aktuelle Malware-Schutz-Lösung installiert und aktiv.', 0, 1, 'offen', '2026-05-09'),
(16, 'Schutz vor Schadsoftware', 'Malware-Signaturen / Schutzdefinitionen werden täglich oder automatisch aktualisiert.', 0, 1, 'offen', '2026-05-09'),
(17, 'Schutz vor Schadsoftware', 'Regelmäßige automatische Scans sind konfiguriert.', 0, 1, 'offen', '2026-05-09'),
(18, 'Schutz vor Schadsoftware', 'Ausführung von Schadsoftware aus E-Mail-Anhängen und Webdownloads wird blockiert.', 0, 1, 'offen', '2026-05-09'),
(19, 'Schutz vor Schadsoftware', 'Application Whitelisting oder vergleichbare Kontrollmechanismen sind implementiert.', 0, 1, 'offen', '2026-05-09'),
(20, 'Patch-Management', 'Betriebssysteme und Firmware aller Geräte werden innerhalb von 14 Tagen nach Veröffentlichung kritischer Patches aktualisiert.', 0, 1, 'offen', '2026-05-09'),
(21, 'Patch-Management', 'Anwendungssoftware wird innerhalb von 14 Tagen nach Veröffentlichung kritischer Patches aktualisiert.', 0, 1, 'offen', '2026-05-09'),
(22, 'Patch-Management', 'Software, die vom Hersteller nicht mehr unterstützt wird (End-of-Life), ist nicht im Einsatz.', 0, 1, 'offen', '2026-05-09'),
(23, 'Patch-Management', 'Ein Inventar aller eingesetzten Hard- und Software inkl. Versionsstand ist gepflegt.', 0, 1, 'offen', '2026-05-09'),
(24, 'Patch-Management', 'Patches werden vor dem Einspielen in einer Testumgebung geprüft.', 0, 1, 'offen', '2026-05-09');

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
(1, 'Art. 5 – Grundsätze der Verarbeitung', 'Personenbezogene Daten werden nur für festgelegte, eindeutige und legitime Zwecke erhoben (Zweckbindung).', 0, 1, 'offen', NULL),
(2, 'Art. 5 – Grundsätze der Verarbeitung', 'Die Verarbeitung ist auf das notwendige Maß beschränkt (Datensparsamkeit).', 0, 1, 'offen', NULL),
(3, 'Art. 5 – Grundsätze der Verarbeitung', 'Daten werden nur so lange gespeichert wie notwendig (Speicherbegrenzung).', 0, 1, 'offen', NULL),
(4, 'Art. 5 – Grundsätze der Verarbeitung', 'Die Verarbeitung erfolgt rechtmäßig, transparent und nach Treu und Glauben.', 0, 1, 'offen', NULL),
(5, 'Art. 5 – Grundsätze der Verarbeitung', 'Sachliche Richtigkeit der Daten wird sichergestellt und Daten werden ggf. berichtigt.', 0, 1, 'offen', NULL),
(6, 'Art. 6/9 – Rechtsgrundlagen', 'Für jede Verarbeitungstätigkeit liegt eine dokumentierte Rechtsgrundlage vor.', 0, 1, 'offen', NULL),
(7, 'Art. 6/9 – Rechtsgrundlagen', 'Einwilligungen sind freiwillig, informiert und nachweisbar eingeholt.', 0, 1, 'offen', NULL),
(8, 'Art. 6/9 – Rechtsgrundlagen', 'Besondere Kategorien personenbezogener Daten (Art. 9) werden nur mit expliziter Rechtsgrundlage verarbeitet.', 0, 1, 'offen', NULL),
(9, 'Art. 12–14 – Informationspflichten', 'Betroffene werden bei Datenerhebung transparent über die Verarbeitung informiert (Datenschutzhinweise).', 0, 1, 'offen', NULL),
(10, 'Art. 12–14 – Informationspflichten', 'Datenschutzerklärungen sind aktuell, vollständig und leicht zugänglich.', 0, 1, 'offen', NULL),
(11, 'Art. 12–14 – Informationspflichten', 'Informationen werden in klarer und verständlicher Sprache bereitgestellt.', 0, 1, 'offen', NULL),
(12, 'Art. 15–22 – Betroffenenrechte', 'Prozesse zur Bearbeitung von Auskunftsanfragen (Art. 15) sind etabliert und innerhalb der Fristen umsetzbar.', 0, 1, 'offen', NULL),
(13, 'Art. 15–22 – Betroffenenrechte', 'Berichtigung (Art. 16), Löschung (Art. 17) und Einschränkung (Art. 18) können fristgerecht umgesetzt werden.', 0, 1, 'offen', NULL),
(14, 'Art. 15–22 – Betroffenenrechte', 'Widerspruchs- (Art. 21) und Widerrufsrechte (Art. 7 Abs. 3) werden ohne unangemessene Verzögerung bearbeitet.', 0, 1, 'offen', NULL),
(15, 'Art. 15–22 – Betroffenenrechte', 'Recht auf Datenübertragbarkeit (Art. 20) ist technisch umsetzbar.', 0, 1, 'offen', NULL),
(16, 'Art. 24/25 – Verantwortlichkeit & Privacy by Design', 'Privacy by Design und Privacy by Default sind in Entwicklungs- und Beschaffungsprozessen verankert.', 0, 1, 'offen', NULL),
(17, 'Art. 24/25 – Verantwortlichkeit & Privacy by Design', 'Technische und organisatorische Maßnahmen (TOMs) sind dokumentiert und aktuell.', 0, 1, 'offen', NULL),
(18, 'Art. 24/25 – Verantwortlichkeit & Privacy by Design', 'Datenschutz-Folgenabschätzungen (DSFA, Art. 35) werden bei risikoreichen Verarbeitungen durchgeführt.', 0, 1, 'offen', NULL),
(19, 'Art. 26–28 – Auftragsverarbeitung', 'Mit allen Auftragsverarbeitern sind schriftliche AVV nach Art. 28 DSGVO abgeschlossen.', 0, 1, 'offen', NULL),
(20, 'Art. 26–28 – Auftragsverarbeitung', 'Auftragsverarbeiter werden regelmäßig auf Einhaltung der DSGVO-Anforderungen überprüft.', 0, 1, 'offen', NULL),
(21, 'Art. 26–28 – Auftragsverarbeitung', 'Drittlandübermittlungen (Art. 44 ff.) erfolgen nur mit geeigneten Garantien (z.B. SCC, Angemessenheitsbeschluss).', 0, 1, 'offen', NULL),
(22, 'Art. 30 – Verzeichnis der Verarbeitungstätigkeiten (VVT)', 'Ein aktuelles Verzeichnis aller Verarbeitungstätigkeiten (VVT) ist vorhanden.', 0, 1, 'offen', NULL),
(23, 'Art. 30 – Verzeichnis der Verarbeitungstätigkeiten (VVT)', 'Das VVT enthält alle Pflichtangaben gemäß Art. 30 DSGVO.', 0, 1, 'offen', NULL),
(24, 'Art. 30 – Verzeichnis der Verarbeitungstätigkeiten (VVT)', 'Das VVT wird bei neuen oder geänderten Verarbeitungen aktualisiert.', 0, 1, 'offen', NULL),
(25, 'Art. 32 – Technische & Organisatorische Maßnahmen (TOMs)', 'Zugangs-, Zugriffs- und Weitergabekontrolle sind implementiert und dokumentiert.', 0, 1, 'offen', NULL),
(26, 'Art. 32 – Technische & Organisatorische Maßnahmen (TOMs)', 'Daten werden bei Übertragung und Speicherung verschlüsselt (Verschlüsselungskonzept vorhanden).', 0, 1, 'offen', NULL),
(27, 'Art. 32 – Technische & Organisatorische Maßnahmen (TOMs)', 'Pseudonymisierung und Anonymisierung werden eingesetzt, wo technisch möglich.', 0, 1, 'offen', NULL),
(28, 'Art. 32 – Technische & Organisatorische Maßnahmen (TOMs)', 'Verfügbarkeit und Belastbarkeit der Systeme werden durch Backups und BCM sichergestellt.', 0, 1, 'offen', NULL),
(29, 'Art. 32 – Technische & Organisatorische Maßnahmen (TOMs)', 'TOMs werden regelmäßig überprüft und bei Bedarf angepasst.', 0, 1, 'offen', NULL),
(30, 'Art. 33/34 – Meldepflichten bei Datenpannen', 'Ein Prozess zur Erkennung, Dokumentation und Meldung von Datenpannen ist etabliert.', 0, 1, 'offen', NULL),
(31, 'Art. 33/34 – Meldepflichten bei Datenpannen', 'Datenpannen werden binnen 72 Stunden der zuständigen Aufsichtsbehörde gemeldet (Art. 33).', 0, 1, 'offen', NULL),
(32, 'Art. 33/34 – Meldepflichten bei Datenpannen', 'Betroffene Personen werden bei hohem Risiko unverzüglich benachrichtigt (Art. 34).', 0, 1, 'offen', NULL),
(33, 'Art. 33/34 – Meldepflichten bei Datenpannen', 'Datenpannen werden intern dokumentiert (Panning-Register).', 0, 1, 'offen', NULL),
(34, 'Art. 37–39 – Datenschutzbeauftragter (DSB)', 'Es wurde geprüft, ob ein DSB benannt werden muss; das Ergebnis ist dokumentiert.', 0, 1, 'offen', NULL),
(35, 'Art. 37–39 – Datenschutzbeauftragter (DSB)', 'Wenn erforderlich: ein DSB ist benannt, bei der Behörde registriert und seine Kontaktdaten sind veröffentlicht.', 0, 1, 'offen', NULL),
(36, 'Art. 37–39 – Datenschutzbeauftragter (DSB)', 'Der DSB wird frühzeitig in alle datenschutzrelevanten Vorgänge eingebunden.', 0, 1, 'offen', NULL),
(37, 'Schulung & Datenschutzbewusstsein', 'Mitarbeitende werden regelmäßig zum Datenschutz geschult und sensibilisiert.', 0, 1, 'offen', NULL),
(38, 'Schulung & Datenschutzbewusstsein', 'Schulungsnachweise werden dokumentiert.', 0, 1, 'offen', NULL),
(39, 'Schulung & Datenschutzbewusstsein', 'Neue Mitarbeitende werden bei Eintritt über Datenschutzpflichten informiert.', 0, 1, 'offen', NULL);

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
(1, 'Art. 21 – Risikoanalyse & Sicherheitspolitik', 'Es existiert eine dokumentierte Informationssicherheitsrichtlinie (IS-Policy).', 0, 1, 'offen', NULL),
(2, 'Art. 21 – Risikoanalyse & Sicherheitspolitik', 'Es wird regelmäßig (mind. jährlich) eine Risikoanalyse für Netz- und Informationssysteme durchgeführt.', 0, 1, 'offen', NULL),
(3, 'Art. 21 – Risikoanalyse & Sicherheitspolitik', 'Die Risikoanalyse wird dokumentiert und die Ergebnisse werden der Geschäftsleitung vorgelegt.', 0, 1, 'offen', NULL),
(4, 'Art. 21 – Risikoanalyse & Sicherheitspolitik', 'Sicherheitsziele sind messbar definiert und werden regelmäßig überprüft.', 0, 1, 'offen', NULL),
(5, 'Art. 21 – Vorfallbewältigung', 'Ein dokumentiertes Incident-Response-Verfahren ist vorhanden und bekannt.', 0, 1, 'offen', NULL),
(6, 'Art. 21 – Vorfallbewältigung', 'Sicherheitsvorfälle werden klassifiziert (erheblich / nicht erheblich) und protokolliert.', 0, 1, 'offen', NULL),
(7, 'Art. 21 – Vorfallbewältigung', 'Meldepflichten gegenüber der zuständigen Behörde (BSI/ENISA) sind bekannt und eingehalten (Frühwarnung 24h, Meldung 72h, Abschlussbericht).', 0, 1, 'offen', NULL),
(8, 'Art. 21 – Vorfallbewältigung', 'Sicherheitsvorfälle werden nach Abschluss ausgewertet (Post-Incident Review).', 0, 1, 'offen', NULL),
(9, 'Art. 21 – Business Continuity & BCM', 'Ein Business-Continuity-Plan (BCP) für kritische Dienste ist vorhanden.', 0, 1, 'offen', NULL),
(10, 'Art. 21 – Business Continuity & BCM', 'Backup-Verfahren für kritische Systeme sind implementiert und werden regelmäßig getestet.', 0, 1, 'offen', NULL),
(11, 'Art. 21 – Business Continuity & BCM', 'Wiederanlaufpläne (DRP) sind dokumentiert und erprobt.', 0, 1, 'offen', NULL),
(12, 'Art. 21 – Business Continuity & BCM', 'Notfallübungen (Tabletop/Simulationen) werden mind. jährlich durchgeführt.', 0, 1, 'offen', NULL),
(13, 'Art. 21 – Lieferkettensicherheit', 'Lieferanten und Dienstleister werden hinsichtlich ihrer Sicherheitsmaßnahmen bewertet.', 0, 1, 'offen', NULL),
(14, 'Art. 21 – Lieferkettensicherheit', 'Sicherheitsanforderungen sind vertraglich mit Dritten vereinbart.', 0, 1, 'offen', NULL),
(15, 'Art. 21 – Lieferkettensicherheit', 'Kritische Abhängigkeiten in der Lieferkette sind identifiziert und dokumentiert.', 0, 1, 'offen', NULL),
(16, 'Art. 21 – Lieferkettensicherheit', 'Regelmäßige Überprüfung der Lieferantensicherheit (Audits, Fragebögen) findet statt.', 0, 1, 'offen', NULL),
(17, 'Art. 21 – Sicherheit in Entwicklung & Beschaffung', 'Security-by-Design ist in den Entwicklungsprozess integriert.', 0, 1, 'offen', NULL),
(18, 'Art. 21 – Sicherheit in Entwicklung & Beschaffung', 'Sichere Konfigurationsstandards (Hardening) werden für Systeme angewendet.', 0, 1, 'offen', NULL),
(19, 'Art. 21 – Sicherheit in Entwicklung & Beschaffung', 'Schwachstellen-Management und Patch-Management-Prozesse sind etabliert.', 0, 1, 'offen', NULL),
(20, 'Art. 21 – Sicherheit in Entwicklung & Beschaffung', 'Penetrationstests oder Sicherheitsaudits von Anwendungen werden regelmäßig durchgeführt.', 0, 1, 'offen', NULL),
(21, 'Art. 21 – Wirksamkeitsbewertung', 'Die Wirksamkeit der Sicherheitsmaßnahmen wird regelmäßig gemessen und bewertet.', 0, 1, 'offen', NULL),
(22, 'Art. 21 – Wirksamkeitsbewertung', 'Interne Audits oder Reviews der Sicherheitsmaßnahmen werden durchgeführt.', 0, 1, 'offen', NULL),
(23, 'Art. 21 – Wirksamkeitsbewertung', 'KPIs/Metriken für Informationssicherheit sind definiert.', 0, 1, 'offen', NULL),
(24, 'Art. 21 – Cyberhygiene & Schulungen', 'Regelmäßige Sicherheitsschulungen und Awareness-Programme für Mitarbeitende sind etabliert.', 0, 1, 'offen', NULL),
(25, 'Art. 21 – Cyberhygiene & Schulungen', 'Grundlegende Cyberhygiene-Maßnahmen (Passwortrichtlinien, Updates, Clean-Desk etc.) sind umgesetzt.', 0, 1, 'offen', NULL),
(26, 'Art. 21 – Cyberhygiene & Schulungen', 'Schulungsnachweise werden dokumentiert.', 0, 1, 'offen', NULL),
(27, 'Art. 21 – Cyberhygiene & Schulungen', 'Phishing-Simulationen oder ähnliche Tests werden regelmäßig durchgeführt.', 0, 1, 'offen', NULL),
(28, 'Art. 21 – Kryptographie & Verschlüsselung', 'Eine Kryptographierichtlinie ist vorhanden und aktuell.', 0, 1, 'offen', NULL),
(29, 'Art. 21 – Kryptographie & Verschlüsselung', 'Verschlüsselung wird für sensitive Daten (at rest und in transit) eingesetzt.', 0, 1, 'offen', NULL),
(30, 'Art. 21 – Kryptographie & Verschlüsselung', 'Schlüsselverwaltungsprozesse sind dokumentiert und implementiert.', 0, 1, 'offen', NULL),
(31, 'Art. 21 – Personalsicherheit & Zugangskontrolle', 'Zugriffsrechte werden nach dem Least-Privilege-Prinzip vergeben.', 0, 1, 'offen', NULL),
(32, 'Art. 21 – Personalsicherheit & Zugangskontrolle', 'Berechtigungen werden bei Austritt oder Rollenwechsel umgehend entzogen.', 0, 1, 'offen', NULL),
(33, 'Art. 21 – Personalsicherheit & Zugangskontrolle', 'Privilegierte Konten (Admin-Accounts) sind inventarisiert und besonders geschützt.', 0, 1, 'offen', NULL),
(34, 'Art. 21 – Personalsicherheit & Zugangskontrolle', 'Multi-Faktor-Authentifizierung (MFA) ist für kritische Systeme und Remote-Zugriff umgesetzt.', 0, 1, 'offen', NULL),
(35, 'Art. 21 – Personalsicherheit & Zugangskontrolle', 'Hintergrundüberprüfungen für Stellen mit sensiblem Systemzugang werden durchgeführt.', 0, 1, 'offen', NULL),
(36, 'Art. 21 – Asset-Management', 'Ein aktuelles Inventar aller kritischen Netz- und Informationssysteme ist vorhanden.', 0, 1, 'offen', NULL),
(37, 'Art. 21 – Asset-Management', 'Assets werden klassifiziert (Kritikalität, Schutzbedarf).', 0, 1, 'offen', NULL),
(38, 'Art. 21 – Asset-Management', 'Verantwortliche (Owner) für kritische Assets sind benannt.', 0, 1, 'offen', NULL),
(39, 'Art. 21 – Physische Sicherheit', 'Physische Zugangskontrollen für IT-Infrastruktur (Rechenzentrum, Server) sind implementiert.', 0, 1, 'offen', NULL),
(40, 'Art. 21 – Physische Sicherheit', 'Schutz vor Umweltbedrohungen (Brand, Wasser, Strom) ist gewährleistet.', 0, 1, 'offen', NULL),
(41, 'Art. 21 – Physische Sicherheit', 'Physische Sicherheitsmaßnahmen werden regelmäßig überprüft.', 0, 1, 'offen', NULL),
(42, 'Art. 21 – Netzwerksicherheit', 'Netzwerksegmentierung ist umgesetzt (z.B. DMZ, VLANs).', 0, 1, 'offen', NULL),
(43, 'Art. 21 – Netzwerksicherheit', 'Netzwerkverkehr wird überwacht und protokolliert (IDS/IPS, SIEM).', 0, 1, 'offen', NULL),
(44, 'Art. 21 – Netzwerksicherheit', 'Remote-Zugriffe sind abgesichert (VPN, Zero Trust).', 0, 1, 'offen', NULL),
(45, 'Art. 21 – Netzwerksicherheit', 'Firewalls und Perimeter-Schutz sind konfiguriert und aktuell.', 0, 1, 'offen', NULL),
(46, 'Art. 20 – Governance & Leitungsverantwortung', 'Die Leitungsebene hat die Cybersicherheitsmaßnahmen formell gebilligt.', 0, 1, 'offen', NULL),
(47, 'Art. 20 – Governance & Leitungsverantwortung', 'Ein Verantwortlicher für Informationssicherheit (CISO/ISB) ist benannt.', 0, 1, 'offen', NULL),
(48, 'Art. 20 – Governance & Leitungsverantwortung', 'Die Leitungsebene wird regelmäßig über den Sicherheitsstatus informiert.', 0, 1, 'offen', NULL),
(49, 'Art. 20 – Governance & Leitungsverantwortung', 'Leitungspersonen haben nachweislich an Schulungen zu Cybersicherheit teilgenommen.', 0, 1, 'offen', NULL),
(50, 'Art. 23 – Meldepflichten bei erheblichen Vorfällen', 'Prozesse zur Identifikation erheblicher Sicherheitsvorfälle sind vorhanden.', 0, 1, 'offen', NULL),
(51, 'Art. 23 – Meldepflichten bei erheblichen Vorfällen', 'Kontaktdaten und Meldeweg zur zuständigen Behörde (z.B. BSI) sind bekannt und dokumentiert.', 0, 1, 'offen', NULL),
(52, 'Art. 23 – Meldepflichten bei erheblichen Vorfällen', 'Frühwarnung (24h), Meldung (72h) und Abschlussbericht (1 Monat) können fristgerecht erfolgen.', 0, 1, 'offen', NULL),
(53, 'Art. 23 – Meldepflichten bei erheblichen Vorfällen', 'Kommunikationspläne für Behörden und ggf. Öffentlichkeit (Art. 23 Abs. 3) sind vorbereitet.', 0, 1, 'offen', NULL);

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
(1, '1. Informationssicherheitsmanagement', 'Eine Informationssicherheitsleitlinie ist von der Geschäftsleitung verabschiedet und kommuniziert.', 0, 1, 'offen', NULL),
(2, '1. Informationssicherheitsmanagement', 'Ein Informationssicherheitsmanagementsystem (ISMS) ist implementiert und wird aufrechterhalten.', 0, 1, 'offen', NULL),
(3, '1. Informationssicherheitsmanagement', 'Ein CISO oder verantwortlicher IS-Beauftragter ist benannt.', 0, 1, 'offen', NULL),
(4, '1. Informationssicherheitsmanagement', 'Das ISMS wird regelmäßig überprüft und kontinuierlich verbessert (KVP).', 0, 1, 'offen', NULL),
(5, '1. Informationssicherheitsmanagement', 'Management-Reviews zur Informationssicherheit finden mindestens jährlich statt.', 0, 1, 'offen', NULL),
(6, '2. Risikomanagement', 'Ein dokumentierter Risikomanagementprozess für Informationssicherheit ist etabliert.', 0, 1, 'offen', NULL),
(7, '2. Risikomanagement', 'Informationssicherheitsrisiken werden regelmäßig identifiziert, bewertet und behandelt.', 0, 1, 'offen', NULL),
(8, '2. Risikomanagement', 'Risikobehandlungspläne werden verfolgt und deren Wirksamkeit überprüft.', 0, 1, 'offen', NULL),
(9, '2. Risikomanagement', 'Restrisiken sind von der Geschäftsleitung akzeptiert und dokumentiert.', 0, 1, 'offen', NULL),
(10, '3. Asset-Management & Schutzbedarfsfeststellung', 'Alle informationsverarbeitenden Assets sind inventarisiert (Asset-Register).', 0, 1, 'offen', NULL),
(11, '3. Asset-Management & Schutzbedarfsfeststellung', 'Schutzbedarf von Informationen und Systemen ist nach Vertraulichkeit, Integrität, Verfügbarkeit festgestellt.', 0, 1, 'offen', NULL),
(12, '3. Asset-Management & Schutzbedarfsfeststellung', 'Schutzbedarfskategorien sind definiert und werden bei der Auswahl von Maßnahmen berücksichtigt.', 0, 1, 'offen', NULL),
(13, '3. Asset-Management & Schutzbedarfsfeststellung', 'Informationen von OEM-Kunden (z.B. Konstruktionsdaten) sind klassifiziert und besonders geschützt.', 0, 1, 'offen', NULL),
(14, '4. Physische Sicherheit', 'Serverräume und Bereiche mit schutzbedürftigen Informationen sind gegen unbefugten Zutritt gesichert.', 0, 1, 'offen', NULL),
(15, '4. Physische Sicherheit', 'Zutrittskontrollsystem ist implementiert; Zutrittsrechte werden regelmäßig überprüft.', 0, 1, 'offen', NULL),
(16, '4. Physische Sicherheit', 'Besucher werden registriert und begleitet.', 0, 1, 'offen', NULL),
(17, '4. Physische Sicherheit', 'Schutz gegen Feuer, Wasser und sonstige Umwelteinflüsse ist vorhanden.', 0, 1, 'offen', NULL),
(18, '4. Physische Sicherheit', 'Prototypen und schutzbedürftige physische Objekte sind gesichert (Prototypenschutz).', 0, 1, 'offen', NULL),
(19, '5. Personal & Schulungen', 'Mitarbeitende werden vor Aufnahme der Tätigkeit auf Zuverlässigkeit geprüft (Hintergrundüberprüfung, soweit rechtlich zulässig).', 0, 1, 'offen', NULL),
(20, '5. Personal & Schulungen', 'Mitarbeitende werden regelmäßig zur Informationssicherheit und Vertraulichkeit geschult.', 0, 1, 'offen', NULL),
(21, '5. Personal & Schulungen', 'Geheimhaltungsvereinbarungen (NDA) sind mit Mitarbeitenden und relevanten Dritten abgeschlossen.', 0, 1, 'offen', NULL),
(22, '5. Personal & Schulungen', 'Beim Ausscheiden werden Zugriffsrechte entzogen und Assets zurückgegeben.', 0, 1, 'offen', NULL),
(23, '6. Zugriffsmanagement', 'Zugriffsrechte werden nach dem Least-Privilege-Prinzip vergeben und regelmäßig überprüft.', 0, 1, 'offen', NULL),
(24, '6. Zugriffsmanagement', 'Administrative Zugänge sind besonders gesichert (MFA, Protokollierung).', 0, 1, 'offen', NULL),
(25, '6. Zugriffsmanagement', 'Remote-Zugriffe erfolgen ausschließlich über verschlüsselte und authentifizierte Verbindungen.', 0, 1, 'offen', NULL),
(26, '6. Zugriffsmanagement', 'Passwortrichtlinien mit Mindestanforderungen sind definiert und durchgesetzt.', 0, 1, 'offen', NULL),
(27, '7. Kryptographie', 'Eine Kryptographierichtlinie mit aktuellen Algorithmen und Schlüssellängen ist vorhanden.', 0, 1, 'offen', NULL),
(28, '7. Kryptographie', 'Schutzbedürftige Daten werden bei Übertragung und Speicherung verschlüsselt.', 0, 1, 'offen', NULL),
(29, '7. Kryptographie', 'Zertifikats- und Schlüsselverwaltung ist geregelt (Gültigkeiten, Erneuerung, Widerruf).', 0, 1, 'offen', NULL),
(30, '8. IT- & Netzwerksicherheit', 'Netzwerke sind segmentiert; schutzbedürftige Systeme sind in separaten Zonen.', 0, 1, 'offen', NULL),
(31, '8. IT- & Netzwerksicherheit', 'Schadsoftware-Schutz ist auf allen relevanten Endpunkten implementiert und aktuell.', 0, 1, 'offen', NULL),
(32, '8. IT- & Netzwerksicherheit', 'Patch- und Schwachstellenmanagement ist etabliert; kritische Patches werden zeitnah eingespielt.', 0, 1, 'offen', NULL),
(33, '8. IT- & Netzwerksicherheit', 'Netzwerkzugriffe werden protokolliert und überwacht.', 0, 1, 'offen', NULL),
(34, '8. IT- & Netzwerksicherheit', 'WLAN-Netze sind sicher konfiguriert und von Produktionsnetzen getrennt.', 0, 1, 'offen', NULL),
(35, '9. Lieferanten & Dienstleister', 'Informationssicherheitsanforderungen sind vertraglich mit Lieferanten und Dienstleistern vereinbart.', 0, 1, 'offen', NULL),
(36, '9. Lieferanten & Dienstleister', 'Lieferanten werden hinsichtlich Informationssicherheit bewertet (z.B. TISAX-Nachweis oder Audit).', 0, 1, 'offen', NULL),
(37, '9. Lieferanten & Dienstleister', 'Zugriffe von Dritten auf interne Systeme und Daten werden kontrolliert und protokolliert.', 0, 1, 'offen', NULL),
(38, '9. Lieferanten & Dienstleister', 'Die Weitergabe schutzbedürftiger Kundeninformationen an Dritte ist geregelt und genehmigt.', 0, 1, 'offen', NULL),
(39, '10. Vorfallmanagement', 'Ein Incident-Response-Prozess für Informationssicherheitsvorfälle ist dokumentiert und erprobt.', 0, 1, 'offen', NULL),
(40, '10. Vorfallmanagement', 'Sicherheitsvorfälle werden klassifiziert, dokumentiert und analysiert.', 0, 1, 'offen', NULL),
(41, '10. Vorfallmanagement', 'OEM-Kunden werden bei sicherheitsrelevanten Vorfällen mit Auswirkung auf deren Daten informiert.', 0, 1, 'offen', NULL),
(42, '10. Vorfallmanagement', 'Post-Incident-Reviews führen zu dokumentierten Verbesserungsmaßnahmen.', 0, 1, 'offen', NULL),
(43, '11. Business Continuity Management', 'Ein Business-Continuity-Plan (BCP) für kritische Prozesse und Systeme ist vorhanden.', 0, 1, 'offen', NULL),
(44, '11. Business Continuity Management', 'Backups werden regelmäßig erstellt, verschlüsselt gespeichert und auf Wiederherstellbarkeit getestet.', 0, 1, 'offen', NULL),
(45, '11. Business Continuity Management', 'BCM-Tests und Notfallübungen werden mindestens jährlich durchgeführt.', 0, 1, 'offen', NULL),
(46, '11. Business Continuity Management', 'RTO und RPO sind für kritische Systeme definiert und werden eingehalten.', 0, 1, 'offen', NULL),
(47, '12. Compliance & Audit', 'Interne Audits zur Informationssicherheit werden regelmäßig durchgeführt.', 0, 1, 'offen', NULL),
(48, '12. Compliance & Audit', 'TISAX-Anforderungen sind bekannt; ein TISAX-Assessment ist geplant oder durchgeführt.', 0, 1, 'offen', NULL),
(49, '12. Compliance & Audit', 'Maßnahmen aus Audits und Assessments werden nachverfolgt und abgearbeitet.', 0, 1, 'offen', NULL),
(50, '12. Compliance & Audit', 'Rechtliche und vertragliche Anforderungen zur Informationssicherheit (inkl. OEM-Vorgaben) sind bekannt und eingehalten.', 0, 1, 'offen', NULL);

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
(1, '1. Organisation & Managementsystem', 'Eine Informationssicherheits-Leitlinie (IS-Policy) ist dokumentiert, von der Geschäftsführung verabschiedet und kommuniziert.', 0, 1, 'offen', NULL),
(2, '1. Organisation & Managementsystem', 'Verantwortlichkeiten für Informationssicherheit sind schriftlich geregelt (IS-Beauftragter oder gleichwertige Funktion).', 0, 1, 'offen', NULL),
(3, '1. Organisation & Managementsystem', 'Informationssicherheit ist in Geschäftsprozesse und Projekte integriert.', 0, 1, 'offen', NULL),
(4, '1. Organisation & Managementsystem', 'Regelmäßige Management-Reviews zur Informationssicherheit finden statt (mind. jährlich).', 0, 1, 'offen', NULL),
(5, '1. Organisation & Managementsystem', 'Ein Verbesserungsprozess (KVP) für die Informationssicherheit ist etabliert.', 0, 1, 'offen', NULL),
(6, '2. Risikomanagement', 'Ein dokumentiertes Risikoanalyseverfahren für Informationssicherheit ist vorhanden.', 0, 1, 'offen', NULL),
(7, '2. Risikomanagement', 'Risiken werden regelmäßig (mind. jährlich) identifiziert, bewertet und behandelt.', 0, 1, 'offen', NULL),
(8, '2. Risikomanagement', 'Risikoakzeptanzkriterien sind definiert und dokumentiert.', 0, 1, 'offen', NULL),
(9, '2. Risikomanagement', 'Ergebnisse der Risikobehandlung werden verfolgt und dokumentiert.', 0, 1, 'offen', NULL),
(10, '2. Risikomanagement', 'Risiken für Lieferketten und Drittparteien werden berücksichtigt.', 0, 1, 'offen', NULL),
(11, '3. Personal & Sensibilisierung', 'Mitarbeiter werden bei Einstellung und regelmäßig zu Informationssicherheit geschult.', 0, 1, 'offen', NULL),
(12, '3. Personal & Sensibilisierung', 'Sicherheitsrichtlinien werden von Mitarbeitern nachweislich zur Kenntnis genommen.', 0, 1, 'offen', NULL),
(13, '3. Personal & Sensibilisierung', 'Beim Ausscheiden von Mitarbeitern werden Zugänge umgehend entzogen und Assets zurückgefordert.', 0, 1, 'offen', NULL),
(14, '3. Personal & Sensibilisierung', 'Für sicherheitsrelevante Rollen existieren spezifische Schulungsmaßnahmen.', 0, 1, 'offen', NULL),
(15, '4. Asset-Management', 'Ein aktuelles Inventar aller informationsverarbeitenden Assets (Hard- und Software) wird gepflegt.', 0, 1, 'offen', NULL),
(16, '4. Asset-Management', 'Alle Assets sind einem Verantwortlichen (Owner) zugeordnet.', 0, 1, 'offen', NULL),
(17, '4. Asset-Management', 'Informationen sind nach Schutzbedarf klassifiziert.', 0, 1, 'offen', NULL),
(18, '4. Asset-Management', 'Regelungen zur Handhabung von Wechseldatenträgern und mobilen Geräten sind vorhanden.', 0, 1, 'offen', NULL),
(19, '4. Asset-Management', 'Eine geregelte Entsorgung von Datenträgern (Datenlöschung/-vernichtung) ist dokumentiert.', 0, 1, 'offen', NULL),
(20, '5. Zugriffskontrolle & Identitätsmanagement', 'Zugriffsrechte werden nach dem Least-Privilege-Prinzip vergeben und regelmäßig überprüft.', 0, 1, 'offen', NULL),
(21, '5. Zugriffskontrolle & Identitätsmanagement', 'Administrative Berechtigungen sind auf das notwendige Minimum beschränkt.', 0, 1, 'offen', NULL),
(22, '5. Zugriffskontrolle & Identitätsmanagement', 'Ein Passwort-/Authentifizierungskonzept mit Mindestanforderungen ist dokumentiert und umgesetzt.', 0, 1, 'offen', NULL),
(23, '5. Zugriffskontrolle & Identitätsmanagement', 'Multi-Faktor-Authentifizierung ist für Remote-Zugriffe und privilegierte Konten eingesetzt.', 0, 1, 'offen', NULL),
(24, '5. Zugriffskontrolle & Identitätsmanagement', 'Benutzerkonten werden bei Ausscheiden oder Rollenwechsel unverzüglich angepasst.', 0, 1, 'offen', NULL),
(25, '6. Kryptografie', 'Eine Kryptografierichtlinie mit Vorgaben zu Algorithmen und Schlüssellängen ist vorhanden.', 0, 1, 'offen', NULL),
(26, '6. Kryptografie', 'Sensitive Daten werden bei Übertragung und Speicherung verschlüsselt.', 0, 1, 'offen', NULL),
(27, '6. Kryptografie', 'Zertifikats- und Schlüsselverwaltung ist geregelt (Lebenszyklusmanagement).', 0, 1, 'offen', NULL),
(28, '7. Physische Sicherheit', 'Serverräume und IT-Infrastruktur sind gegen unbefugten Zutritt gesichert.', 0, 1, 'offen', NULL),
(29, '7. Physische Sicherheit', 'Zutrittskontrolle zu sensitiven Bereichen ist dokumentiert und wird protokolliert.', 0, 1, 'offen', NULL),
(30, '7. Physische Sicherheit', 'Schutzmaßnahmen gegen Feuer, Wasser und Umwelteinflüsse sind vorhanden.', 0, 1, 'offen', NULL),
(31, '7. Physische Sicherheit', 'Clean-Desk-Richtlinie und Schutz vor Sichtbarkeit sensibler Informationen sind umgesetzt.', 0, 1, 'offen', NULL),
(32, '8. Betriebssicherheit', 'Betriebsdokumentation (Betriebshandbücher, Konfigurationen) ist aktuell gepflegt.', 0, 1, 'offen', NULL),
(33, '8. Betriebssicherheit', 'Änderungen an IT-Systemen unterliegen einem geregelten Change-Management-Prozess.', 0, 1, 'offen', NULL),
(34, '8. Betriebssicherheit', 'Kapazitäten werden überwacht und geplant (Kapazitätsmanagement).', 0, 1, 'offen', NULL),
(35, '8. Betriebssicherheit', 'Test- und Entwicklungsumgebungen sind von Produktivumgebungen getrennt.', 0, 1, 'offen', NULL),
(36, '8. Betriebssicherheit', 'Schadsoftware-Schutz ist auf allen relevanten Systemen installiert und aktuell.', 0, 1, 'offen', NULL),
(37, '8. Betriebssicherheit', 'Sicherheitsrelevante Ereignisse werden protokolliert und Logs regelmäßig ausgewertet.', 0, 1, 'offen', NULL),
(38, '9. Netzwerksicherheit', 'Das Netzwerk ist segmentiert; kritische Systeme sind in separaten Zonen.', 0, 1, 'offen', NULL),
(39, '9. Netzwerksicherheit', 'Netzwerkzugänge (intern/extern) werden durch Firewalls oder äquivalente Systeme kontrolliert.', 0, 1, 'offen', NULL),
(40, '9. Netzwerksicherheit', 'Fernzugriffe auf das Netzwerk erfolgen ausschließlich über gesicherte Verbindungen (VPN/verschlüsselt).', 0, 1, 'offen', NULL),
(41, '9. Netzwerksicherheit', 'WLAN-Netzwerke sind von Produktivnetzwerken getrennt und sicher konfiguriert.', 0, 1, 'offen', NULL),
(42, '9. Netzwerksicherheit', 'Netzwerkaktivitäten werden überwacht (IDS/IPS oder vergleichbar).', 0, 1, 'offen', NULL),
(43, '10. Lieferanten & Drittparteien', 'Sicherheitsanforderungen an Lieferanten und Dienstleister sind vertraglich vereinbart.', 0, 1, 'offen', NULL),
(44, '10. Lieferanten & Drittparteien', 'Die Einhaltung der Sicherheitsanforderungen durch Dritte wird regelmäßig überprüft.', 0, 1, 'offen', NULL),
(45, '10. Lieferanten & Drittparteien', 'Zugriffe von Dritten auf interne Systeme werden kontrolliert und protokolliert.', 0, 1, 'offen', NULL),
(46, '10. Lieferanten & Drittparteien', 'AVV (Auftragsverarbeitungsvertrag) liegt für alle relevanten Dienstleister vor.', 0, 1, 'offen', NULL),
(47, '11. Vorfallmanagement', 'Ein dokumentierter Incident-Response-Prozess ist vorhanden und erprobt.', 0, 1, 'offen', NULL),
(48, '11. Vorfallmanagement', 'Sicherheitsvorfälle werden klassifiziert, dokumentiert und ausgewertet.', 0, 1, 'offen', NULL),
(49, '11. Vorfallmanagement', 'Meldepflichten (intern/extern, z.B. Datenschutzbehörde, BSI) sind bekannt und eingehalten.', 0, 1, 'offen', NULL),
(50, '11. Vorfallmanagement', 'Post-Incident-Reviews führen zu nachverfolgbaren Verbesserungsmaßnahmen.', 0, 1, 'offen', NULL),
(51, '12. Business Continuity & Notfallmanagement', 'Ein Business-Continuity-Plan (BCP) für kritische Geschäftsprozesse ist dokumentiert.', 0, 1, 'offen', NULL),
(52, '12. Business Continuity & Notfallmanagement', 'Backup-Konzept ist vorhanden; Datensicherungen werden regelmäßig durchgeführt und getestet.', 0, 1, 'offen', NULL),
(53, '12. Business Continuity & Notfallmanagement', 'Wiederanlaufpläne (DRP) sind dokumentiert und Wiederanlaufzeiten (RTO/RPO) sind definiert.', 0, 1, 'offen', NULL),
(54, '12. Business Continuity & Notfallmanagement', 'BCM-Tests und Notfallübungen werden mind. jährlich durchgeführt.', 0, 1, 'offen', NULL),
(55, '13. Compliance & Datenschutz', 'Relevante gesetzliche und regulatorische Anforderungen (DSGVO, HGB, etc.) sind identifiziert und eingehalten.', 0, 1, 'offen', NULL),
(56, '13. Compliance & Datenschutz', 'Interne Audits zur Informationssicherheit werden regelmäßig (mind. jährlich) durchgeführt.', 0, 1, 'offen', NULL),
(57, '13. Compliance & Datenschutz', 'Ein Datenschutzkonzept und ein Verzeichnis von Verarbeitungstätigkeiten (VVT) sind vorhanden.', 0, 1, 'offen', NULL),
(58, '13. Compliance & Datenschutz', 'Verstöße gegen Sicherheitsrichtlinien werden konsequent verfolgt und dokumentiert.', 0, 1, 'offen', NULL),
(59, '14. Patch- & Schwachstellenmanagement', 'Ein strukturierter Prozess zur zeitnahen Einspielung von Sicherheits-Patches ist etabliert.', 0, 1, 'offen', NULL),
(60, '14. Patch- & Schwachstellenmanagement', 'Schwachstellen in IT-Systemen werden regelmäßig gescannt und bewertet.', 0, 1, 'offen', NULL),
(61, '14. Patch- & Schwachstellenmanagement', 'Kritische Schwachstellen werden innerhalb definierter Fristen behoben.', 0, 1, 'offen', NULL),
(62, '14. Patch- & Schwachstellenmanagement', 'Software, die vom Hersteller nicht mehr unterstützt wird (End-of-Life), ist nicht produktiv im Einsatz.', 0, 1, 'offen', NULL);

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
  `geaendert` date DEFAULT NULL
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
  `werpruefen` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `werfreigeben` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `freizugeben` tinyint(1) NOT NULL DEFAULT 0,
  `istfreigegeben` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `vendor` varchar(256) DEFAULT NULL
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
  `Text` text DEFAULT NULL,
  `name_en` varchar(256) DEFAULT NULL,
  `text_en` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ismshilfe`
--

INSERT INTO `ismshilfe` (`id`, `seite`, `name`, `Text`, `name_en`, `text_en`) VALUES
(1, 'dokumente', 'Dokumente', '<h1>Dokumente</h1>\n<h2>Beschreibung</h2>\n<p class=\"MsoNormal\">Das Dokumentenmodul ist das Rückgrat der dokumentarischen Nachweisführung im ISMS. ISO/IEC 27001:2022 Kapitel 7.5 verlangt explizit, dass alle dokumentierten Informationen des ISMS kontrolliert werden: erstellt, aktualisiert, verteilt, zugänglich gemacht und vor unbeabsichtigter Löschung oder Änderung geschützt. Das Dokumentenmodul erfüllt diese Anforderungen durch einen strukturierten Freigabe-Workflow, Versionierung und optional aktivierbaren Schreibschutz.  Im ISMS sind Dokumente mehr als Ablageware – sie sind die Nachweisgrundlage für jeden Audit und jede Zertifizierungsprüfung. Ohne nachweislich freigegebene und aktuelle Richtlinien (Information Security Policy, Acceptable Use Policy, Passwortrichtlinie etc.) kann kein ISMS zertifiziert werden. Das Dokumentenmodul verwaltet alle Dokumenttypen: Richtlinien, Arbeitsanweisungen, Prozessbeschreibungen, Checklisten, Formulare und Schulungsunterlagen.  Der dreistufige Freigabe-Workflow (In Arbeit → Geprüft → Freigegeben) stellt sicher, dass nur geprüfte und autorisierte Dokumente im ISMS gelten. Die Versionierung schafft eine lückenlose Änderungshistorie. Die optionale Mehrsprachigkeit (Deutsch / Englisch) unterstützt international tätige Organisationen.</p>\n<h2 class=\"MsoNormal\"> Funktionen</h2>\n<ul>\n<li class=\"MsoListParagraph\"><strong>Dokumentenliste: </strong>Filter nach Typ, Status, Kategorie; Pagination; Suche</li>\n<li class=\"MsoListParagraph\"><strong>Detailansicht: </strong>Vollständiger Dokumenteninhalt mit Metadaten, Anhängen und verknüpften BPMN-Diagrammen</li>\n<li class=\"MsoListParagraph\"><strong>Workflow: Prüfen: </strong>Im Schritt „Prüfen\" bestätigt ein explizit zugewiesener Prüfer (eine fachkundige Person, die den Inhalt inhaltlich beurteilen kann), dass das Dokument vollständig, korrekt und aktuell ist. Die Bestätigung erzeugt einen Zeitstempel, der als Nachweis der fachlichen Prüfung dient. Erst nach abgeschlossener Prüfung kann das Dokument in den Freigabeschritt übergehen.</li>\n<li class=\"MsoListParagraph\"><strong>Workflow: Freigeben: </strong>Die formale Freigabe erteilt eine autorisierte Person (z. B. ISMS-Beauftragter, Geschäftsleitung) mit Hilfe des Freigabe-Buttons. Dieser Schritt signalisiert, dass das Dokument offiziell gilt und verbindlich ist. Freigegebene Dokumente können optional schreibgeschützt werden, sodass keine inhaltlichen Änderungen mehr möglich sind, ohne den Versionsprozess neu zu starten. Diese Funktion entspricht der Anforderung nach „approving of documents\" gemäß ISO 27001 Kapitel 7.5.2.</li>\n<li class=\"MsoListParagraph\"><strong>Workflow: Neue Version: </strong>Erstellt neue Versionsnummer und setzt Status zurück auf \"In Arbeit\"</li>\n<li class=\"MsoListParagraph\"><strong>Schreibschutz: </strong>Freigegebene Dokumente können optional schreibgeschützt werden</li>\n<li class=\"MsoListParagraph\"><strong>Mehrsprachigkeit: </strong>Seperate Felder für deutschen und englischen Dokumenteninhalt</li>\n<li class=\"MsoListParagraph\"><strong>Anhänge: </strong>Datei-Upload pro Dokument (Nachweise, Vorlagen etc.)</li>\n<li class=\"MsoListParagraph\"><strong>Review-Datum: </strong>Regelmäßige Überprüfung wird geplant und als Aufgabe angezeigt</li>\n<li class=\"MsoListParagraph\"><strong>Excel-Export: </strong>Dokumentenliste als .xlsx</li>\n<li class=\"MsoListParagraph\"><strong>Charts: </strong>Status- und Typ-Kreisdiagramme</li>\n</ul>\n<div>\n<h1>BPMN-Prozessmodellierung</h1>\n<h2>Beschreibung</h2>\n<p class=\"MsoNormal\"><span>Das BPMN-Modul (Business Process Model and Notation) integriert professionelle Prozessmodellierung unmittelbar in das ISMS. Im Kontext der Informationssicherheit ist die visuelle Dokumentation von Prozessen in mehrfacher Hinsicht wertvoll: Sicherheitsrelevante Prozesse (Incident-Response, Zugriffsverwaltung, Backup, Change Management) müssen verstanden, kommuniziert und regelmäßig überprüft werden. BPMN-Diagramme schaffen ein gemeinsames Verständnis zwischen IT, Management und Auditoren.<span>  </span>ISO 27001 verlangt keine BPMN-Diagramme explizit, empfiehlt aber die Dokumentation von Prozessen als Teil des ISMS. In der Praxis verlangen viele Auditoren und Zertifizierungsstellen visuelle Prozessnachweise, insbesondere für kritische Sicherheitsprozesse. Das BPMN-Modul ermöglicht die Erstellung dieser Diagramme direkt im Browser mit einem vollwertigen Modeler (bpmn-js), ohne dass externe Tools wie Visio, Camunda oder draw.io erforderlich wären – obwohl der Import aus diesen Tools vollständig unterstützt wird.</span></p>\n<h2>Funktionen</h2>\n<ul>\n<li class=\"MsoListParagraph\"><strong><span>Viewer: </span></strong><span>Interaktive, zoombare Ansicht eines BPMN-Diagramms (read-only)</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Editor: </span></strong><span>Vollständiger BPMN-Modeler auf Basis von bpmn-js (drag &amp; drop, Elemente einfügen)</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Importieren (dok): </span></strong><span>Upload einer .bpmn- oder .xml-Datei aus einer externen BPMN-Anwendung (z.B. Camunda, draw.io)</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Exportieren: </span></strong><span>Download des aktuellen Diagramms als .bpmn-Datei für externe Bearbeitung</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Speichern (dok): </span></strong><span>Diagramm mit Nummer, Titel und Status in der Datenbank ablegen</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Titel-Vorschlag: </span></strong><span>Beim Import wird der Dateiname automatisch als Titelvorschlag übernommen</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Verknüpfung: </span></strong><span>BPMN-Diagramme können in der Dokumentendetailansicht verknüpft werden</span></li>\n</ul>\n<p class=\"MsoNormal\"> </p>\n</div>', '', ''),
(2, 'assets', 'Assets', '<h1>Assets</h1>\n<h2><span>Beschreibung</span></h2>\n<p class=\"MsoNormal\" style=\"\"><span style=\"\">Das Asset-Modul ist die Grundlage jedes wirksamen ISMS: Ohne eine vollständige und aktuelle Inventarliste aller schutzbedürftigen Informationswerte lässt sich weder eine fundierte Risikobewertung noch eine zielgerichtete Maßnahmenumsetzung durchführen. ISO/IEC 27001:2022 Anhang A, Maßnahme 5.9 verlangt explizit ein Inventar aller Assets, die mit Informationen und Informationsverarbeitung verbunden sind.<span style=\"\">  </span>Unter einem Asset versteht WolfISMS jedes Objekt, das für die Organisation informationellen Wert besitzt: IT-Systeme (Server, Endgeräte, Netzwerkkomponenten), Softwareanwendungen, Datenbanken, Cloud-Dienste, aber auch nicht-technische Werte wie Prozessdokumentationen, Verträge oder Mitarbeiterwissen. Für jedes Asset werden die drei Grundwerte der Informationssicherheit bewertet – Vertraulichkeit (C), Integrität (I) und Verfügbarkeit (A) – und daraus eine Gesamtkritikalität abgeleitet, die unmittelbar in die Risikobewertung einfließt.</span></p>\n<h2 style=\"\"><span>Funktionen</span></h2>\n<p class=\"MsoListParagraph\" style=\"\"><span style=\"\"><span style=\"\">·<span style=\"\">    </span></span></span><strong><span style=\"\">Asset-Übersicht: </span></strong><span style=\"\">Kachel- und Listenansicht mit Filter nach Typ, Kategorie, Abteilung und Status</span></p>\n<p class=\"MsoListParagraph\" style=\"\"><span style=\"\"><span style=\"\">·<span style=\"\">    </span></span></span><strong><span style=\"\">CIA-Bewertung: </span></strong><span style=\"\">Die CIA-Triade (Confidentiality, Integrity, Availability) ist das Fundament der Informationssicherheit. Für jedes Asset wird jeder der drei Grundwerte auf einer Skala von 1 (nicht relevant) bis 5 (geschäftskritisch) bewertet. Vertraulichkeit: Wie gravierend wäre eine unbefugte Offenlegung der Daten? Integrität: Welchen Schaden würde eine unerkannte Datenmanipulation verursachen? Verfügbarkeit: Wie lange kann die Organisation ohne dieses Asset funktionieren? Der höchste Einzelwert bestimmt den Schutzbedarf des Assets.</span></p>\n<p class=\"MsoListParagraph\" style=\"\"><span style=\"\"><span style=\"\">·<span style=\"\">    </span></span></span><strong><span style=\"\">Klassifizierung: </span></strong><span style=\"\">Die Klassifizierung eines Assets legt fest, wer Zugang zu den zugehörigen Informationen haben darf und welche Schutzmaßnahmen anzuwenden sind. Die vier Stufen orientieren sich an etablierten Informationsklassifizierungsschemas: Öffentlich (keine Einschränkungen), Intern (nur für Mitarbeitende), Vertraulich (eingeschränkter Kreis, Vertraulichkeitsvereinbarungen erforderlich), Streng vertraulich (Geschäftsleitung und explizit autorisierte Personen). Diese Klassifizierung ist Grundlage für Zugriffssteuerungen und Handhabungsrichtlinien.</span></p>\n<p class=\"MsoListParagraph\" style=\"\"><span style=\"\"><span style=\"\">·<span style=\"\">    </span></span></span><strong><span style=\"\">Kritikalität: </span></strong><span style=\"\">Bewertung der Geschäftskritikalität des Assets</span></p>\n<p class=\"MsoListParagraph\" style=\"\"><span style=\"\"><span style=\"\">·<span style=\"\">    </span></span></span><strong><span style=\"\">Personenbezug: </span></strong><span style=\"\">Assets, die personenbezogene Daten im Sinne der DSGVO verarbeiten, speichern oder übertragen, werden explizit als DSGVO-relevant markiert. Diese Kennzeichnung ist entscheidend für das Verzeichnis von Verarbeitungstätigkeiten (Art. 30 DSGVO), für die Datenschutz-Folgenabschätzung (DSFA) und für die Bestimmung meldepflichtiger Vorfälle (Art. 33/34 DSGVO). WolfISMS nutzt diese Markierung, um bei Incidents automatisch auf eine mögliche DSGVO-Meldepflicht hinzuweisen.</span></p>\n<p class=\"MsoListParagraph\" style=\"\"><span style=\"\"><span style=\"\">·<span style=\"\">    </span></span></span><strong><span style=\"\">Teilassets: </span></strong><span style=\"\">Assets können hierarchisch strukturiert werden: Ein Server (Haupt-Asset) kann mehrere darauf betriebene Applikationen als Teilassets enthalten. Diese Hierarchie ermöglicht eine präzise Schadensfolgenanalyse: Fällt der Server aus, sind automatisch alle zugehörigen Applikationen betroffen. Die Struktur unterstützt auch die Abhängigkeitsanalyse in der Business Impact Analysis (BIA) und im Business Continuity Management (BCM).</span></p>\n<p class=\"MsoListParagraph\" style=\"\"><span style=\"\"><span style=\"\">·<span style=\"\">    </span></span></span><strong><span style=\"\">Review-Datum: </span></strong><span style=\"\">Geplantes Überprüfungsdatum mit automatischer Aufgabenerzeugung</span></p>\n<p class=\"MsoListParagraph\" style=\"\"><span style=\"\"><span style=\"\">·<span style=\"\">    </span></span></span><strong><span style=\"\">Excel-Export: </span></strong><span style=\"\">Vollständiger Asset-Export als .xlsx</span></p>', '', ''),
(3, 'risiko', 'Risiken', '<h1>Risiken</h1>\n<h2>Beschreibung</h2>\n<p class=\"MsoNormal\"><span>Das Risikomodul ist das Kernstück des ISMS und bildet den gesamten Risikomanagementprozess gemäß ISO/IEC 27001:2022 Kapitel 6.1 (Maßnahmen zum Umgang mit Risiken und Chancen) vollständig ab. Informationssicherheitsrisiken systematisch zu identifizieren, zu analysieren, zu bewerten und zu behandeln ist keine optionale Übung – es ist die zentrale Pflicht jedes zertifizierungsrelevanten ISMS.<span>  </span>Das Modul folgt dem anerkannten Risikobewertungsansatz: Für jedes Risiko werden Eintrittswahrscheinlichkeit und potenzielle Schadensauswirkung auf einer fünfstufigen Skala bewertet, sowohl vor als auch nach der Umsetzung von Sicherheitsmaßnahmen (Brutto- und Nettobewertung). Aus diesen Werten ergibt sich automatisch die Risikostufe (niedrig / mittel / hoch / kritisch) sowie der Risikowert als numerisches Produkt.<span>  </span>Jedes Risiko wird anschließend einer Behandlungsoption zugeordnet: Reduzieren (durch Maßnahmen), Akzeptieren (wenn das Restrisiko vertretbar ist), Vermeiden (Aktivität einstellen), Übertragen (z. B. Versicherung) oder Teilen (mit einem Partner). Diese strukturierte Dokumentation ist Voraussetzung für das Risk Treatment Plan (RTP) nach ISO 27001 und bildet die Grundlage für das Management-Review.</span></p>\n<h2>Funktionen</h2>\n<ul>\n<li class=\"MsoListParagraph\"><strong><span>Risikoübersicht: </span></strong><span>Alle erfassten Risiken werden wahlweise als übersichtliche Kacheln (mit Risikofarbe, Titel und Risikostufe) oder als kompakte Tabellenliste dargestellt. Kombinierbare Filter nach Status (offen / in Behandlung / akzeptiert / geschlossen), Kategorie (z. B. IT-Infrastruktur, Personalrisiken, Drittanbieter) und Risikostufe ermöglichen eine gezielte Analyse. Die Gesamtzahl gefilterter Risiken wird stets angezeigt.</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Risikobewertung: </span></strong><span>Für jedes Risiko werden zwei vollständige Bewertungssätze erfasst: die initiale Brutto-Bewertung (vor Maßnahmen) und die Netto-Bewertung (nach Umsetzung von Sicherheitsmaßnahmen). Beide Bewertungen bestehen aus Eintrittswahrscheinlichkeit (1 = sehr unwahrscheinlich bis 5 = sehr wahrscheinlich) und Schadensauswirkung (1 = vernachlässigbar bis 5 = katastrophal). Die Gegenüberstellung beider Bewertungen belegt die Wirksamkeit der getroffenen Maßnahmen – ein wesentliches Argument in Audits und Zertifizierungsverfahren.</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Risikostufen: </span></strong><span>Automatische Berechnung: niedrig / mittel / hoch / kritisch</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Risikobehandlung: </span></strong><span>Die Auswahl der Behandlungsoption dokumentiert die strategische Entscheidung des Managements im Umgang mit dem Risiko. Reduzieren bedeutet: Umsetzung von Maßnahmen zur Verringerung von Eintrittswahrscheinlichkeit oder Auswirkung. Akzeptieren: Das Restrisiko liegt unterhalb der Risikoakzeptanzgrenze. Vermeiden: Die risikoverursachende Aktivität wird eingestellt. Übertragen: Das finanzielle Risiko wird an Dritte (z. B. Versicherung) weitergegeben. Teilen: Gemeinsame Verantwortung mit Partnern oder Dienstleistern.</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Verknüpfungen (risk): </span></strong><span>Jedes Risiko kann mit den betroffenen Assets (welche Informationswerte sind gefährdet?), den zur Behandlung geplanten Maßnahmen, sowie mit identifizierten Bedrohungen (z. B. Phishing, Ransomware, Insider-Bedrohung) und Schwachstellen (z. B. fehlende Patches, ungesicherte Schnittstellen) verknüpft werden. Diese Verknüpfungsstruktur schafft ein vollständiges Risikokontext-Modell und ermöglicht Querauswertungen: Welche Assets sind besonders gefährdet? Welche Maßnahmen reduzieren mehrere Risiken gleichzeitig?</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Business Impact: </span></strong><span>Freitextfeld für Beschreibung der Geschäftsauswirkungen (Richtext)</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Excel-Export: </span></strong><span>Export des gesamten Risikoregisters als .xlsx</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Kategorie-Chart: </span></strong><span>Kreisdiagramm der Risikoverteilung nach Kategorie</span></li>\n</ul>', '', ''),
(4, 'vendor', 'Lieferanten', '<h1>Lieferanten</h1>\n<h2>Beschreibung</h2>\n<p class=\"MsoNormal\"><span>Das Lieferanten-Modul adressiert einen der kritischsten Risikobereiche moderner Organisationen: die Lieferkettensicherheit. Cyberangriffe über kompromittierte Dienstleister – wie die Angriffe auf SolarWinds oder Kaseya – haben gezeigt, dass das eigene ISMS nur so sicher ist wie das schwächste Glied in der Lieferkette. ISO/IEC 27001:2022 Anhang A, Maßnahmen 5.19–5.22 widmen sich explizit der Informationssicherheit in Lieferantenbeziehungen; NIS-2 Artikel 21 Abs. 2 Buchstabe d macht das Supply-Chain-Sicherheitsmanagement zur Pflicht für betroffene Einrichtungen.<span>  </span>Das Modul erfasst alle externen Dienstleister, Cloud-Anbieter, Wartungspartner und Zulieferer und berechnet für jeden automatisch einen Risikoscore. Dieser Score berücksichtigt bis zu sechs Faktoren: Verarbeitung personenbezogener Daten (erhöhtes DSGVO-Risiko), Vertragsstatus (fehlendes Sicherheitsanhang oder AV-Vertrag erhöht das Risiko), vorhandene Zertifizierungen (ISO 27001, SOC 2 etc.), Sicherheitsniveau (Selbstauskunft oder Fragebogen-Ergebnis), Schadenspotenzial bei Ausfall und Eintrittswahrscheinlichkeit. Der resultierende Score klassifiziert Lieferanten in Risikostufen (niedrig / mittel / hoch / kritisch) und in Tier-Klassen (Tier 1 = kritisch bis Tier 3 = unkritisch).</span></p>\n<h2>Funktionen</h2>\n<ul>\n<li class=\"MsoListParagraph\"><strong><span>Lieferantenregister: </span></strong><span>Kachel- und Listenansicht mit Filter nach Typ, Tier und Risikostufe</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Risikoscore: </span></strong><span>Der Risikoscore wird vollautomatisch aus sechs gewichteten Faktoren berechnet und bei jeder Änderung der Lieferantendaten aktualisiert: (1) Personenbezug: Verarbeitet der Lieferant personenbezogene Daten? (2) Vertragsstatus: Besteht ein unterzeichneter Vertrag mit Sicherheitsanhang und Datenschutzvereinbarung? (3) Zertifizierungen: Hat der Lieferant anerkannte Sicherheitszertifizierungen (ISO 27001, SOC 2, CSC-Star etc.)? (4) Sicherheitsniveau: Wie wurde das allgemeine Sicherheitsniveau des Lieferanten bewertet? (5) Schadenspotenzial: Welchen finanziellen und reputationellen Schaden würde ein Sicherheitsvorfall beim Lieferanten verursachen? (6) Eintrittswahrscheinlichkeit: Wie wahrscheinlich ist ein sicherheitsrelevantes Ereignis beim Lieferanten? Der Score fließt direkt in die Lieferanten-Risikomatrix auf dem Dashboard ein.</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Tier-Klassifizierung: </span></strong><span>Lieferant Tier 1 (kritisch) bis Tier 3 (unkritisch)</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Fragebogen-Status: </span></strong><span>Verfolgung des Lieferanten-Sicherheitsfragebogens</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Verknüpfungen (vendor): </span></strong><span>Verlinkung mit Maßnahmen und Incidents</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Review-Datum: </span></strong><span>Regelmäßige Lieferantenbewertung mit Aufgabenerzeugung</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Excel-Export: </span></strong><span>Vollständige Lieferantenliste als .xlsx</span></li>\n<li class=\"MsoListParagraph\"><strong><span>Charts</span><span>: </span></strong><span>Risikostufen- und Typ-Kreisdiagramme</span></li>\n</ul>', '', ''),
(5, 'personal', 'Personal', '<h1>Personal</h1>\n<h2 style=\"\"><span>Beschreibung</span></h2>\n<p class=\"MsoNormal\" style=\"\"><span style=\"\">Das Personalmodul unterstützt eines der am häufigsten unterschätzten, aber zugleich wichtigsten Elemente der Informationssicherheit: den Sicherheitsfaktor Mensch. ISO/IEC 27001:2022 Anhang A, Maßnahme 6.3 verlangt, dass alle Mitarbeitenden und relevanten Vertragspartner angemessene Sicherheitsschulungen erhalten und über aktuelle Richtlinien und Verfahren informiert sind. Phishing, Social Engineering und fahrlässiger Umgang mit Daten sind nach wie vor die häufigsten Ursachen von Sicherheitsvorfällen – Schulungen und nachweisbare Awareness-Maßnahmen sind die wichtigste Gegenmaßnahme.<span style=\"\">  </span>Das Modul zeigt für jeden Mitarbeitenden, welche als schulungsrelevant markierten Dokumente aus dem Dokumentenmodul ihm über das Policy Portal zugänglich gemacht wurden und ob er diese gelesen und bestätigt hat. Diese Nachweisführung ist essenziell für interne Audits und externe Zertifizierungsprüfungen: Auditoren prüfen regelmäßig, ob alle Mitarbeitenden die gültigen Sicherheitsrichtlinien nachweislich zur Kenntnis genommen haben.</span></p>\n<h2 style=\"\"><span>Funktionen</span></h2>\n<ul>\n<li><strong><span style=\"\">Avatar-Kacheln: </span></strong><span style=\"\">Mitarbeiterkacheln mit Initialen, Abteilung, Position und Lesestatus-Balken</span></li>\n<li><strong><span style=\"\">Abteilungs-Filter: </span></strong><span style=\"\">Tab-Reiter je Abteilung + Alphabet-Navigationsleiste</span></li>\n<li><strong><span style=\"\">Dokumentenstatus: </span></strong><span style=\"\">Pro Mitarbeiter: welche Schulungsdokumente wurden gelesen (✅) oder nicht (📭)</span></li>\n<li><strong><span style=\"\">Lesestatus-Balken: </span></strong><span style=\"\">Prozentualer Fortschritt der gelesenen Schulungsdokumente</span></li>\n<li><strong><span style=\"\">Excel-Export (pers): </span></strong><span style=\"\">Zwei Tabs: Mitarbeiterübersicht + vollständige Lesestatus-Matrix</span></li>\n</ul>', '', ''),
(6, 'massnahmen', 'Maßnahmen', '<h1>Maßnahmen</h1>\n<h2 style=\"\"><span>Beschreibung</span></h2>\n<p class=\"MsoNormal\" style=\"\"><span style=\"\">Das Maßnahmen-Modul ist das operative Herzstück des ISMS. Es überführt die im Normen- und Risikomodul identifizierten Anforderungen und Behandlungsnotwendigkeiten in konkrete, terminierte und verantwortlich zugewiesene Umsetzungsaufgaben. Ohne ein lückenloses Maßnahmentracking bleibt das ISMS Theorie – erst die nachgewiesene Umsetzung begründet tatsächliche Sicherheit und Normkonformität.<span style=\"\">  </span>ISO 27001 verlangt in Kapitel 6.1.3 einen dokumentierten Risk Treatment Plan (RTP) mit konkreten Maßnahmen, Verantwortlichkeiten und Terminen. Das Maßnahmen-Modul liefert exakt diese Dokumentation: Jede Maßnahme ist mit einem Besitzer, einer Abteilung, einem Enddatum und einem prozentualen Fortschrittsgrad versehen. Durch die Verknüpfung mit Normanforderungen, Risiken, Lieferanten und Incidents entsteht ein vollständiges Bild davon, warum eine Maßnahme erforderlich ist und welchen Beitrag sie zur Gesamtsicherheitslage leistet.</span></p>\n<h2 style=\"\"><span>Funktionen</span></h2>\n<ul>\n<li><strong><span style=\"\">Status-Tabs: </span></strong><span style=\"\">Schnellfilter: Alle / Offen / In Arbeit / Erledigt / Abgebrochen</span></li>\n<li><strong><span style=\"\">Fortschrittsbalken: </span></strong><span style=\"\">Jede Maßnahme verfügt über einen manuell pflegbaren Fortschrittsbalken (0–100 %), der den aktuellen Umsetzungsstand visualisiert. Die Ampelfarbe wechselt automatisch: grün (≥80 %, auf Kurs), orange (≥50 %, Aufmerksamkeit erforderlich), rot (&lt;50 % oder überfällig). Dieser Fortschrittswert fließt auch in die Projektberechnung ein, wenn die Maßnahme einem Projekt zugeordnet ist.</span></li>\n<li><strong><span style=\"\">Detailansicht: </span></strong><span style=\"\">Vollständige Maßnahmenbeschreibung, Besitzer, Abteilung, Enddatum, Richtext-Inhalt</span></li>\n<li><strong><span style=\"\">Anhänge: </span></strong><span style=\"\">Upload und Verwaltung von Anhängen (Dokumente, Nachweise)</span></li>\n<li><strong><span style=\"\">Verknüpfungen (mass): </span></strong><span style=\"\">Eine Maßnahme kann mit beliebig vielen Quellen verknüpft werden: Risiken (welches Risiko wird durch diese Maßnahme behandelt?), Normanforderungen (welche Compliance-Anforderung wird erfüllt?), Lieferanten (betrifft diese Maßnahme einen externen Dienstleister?) und Incidents (wurde diese Maßnahme als Reaktion auf einen Vorfall initiiert?). Diese Vernetzung schafft einen vollständigen Nachweispfad und ermöglicht Querauswertungen: Welche Maßnahmen haben den größten Compliance-Hebel?</span></li>\n<li><strong><span style=\"\">Review: </span></strong><span style=\"\">Für jede Maßnahme kann ein Review-Datum geplant werden, an dem die Wirksamkeit der Maßnahme überprüft werden soll. WolfISMS erzeugt für den zuständigen Benutzer automatisch eine Aufgabe, die im Aufgaben-Modul und auf dem Dashboard erscheint. Diese Funktion unterstützt die Anforderung aus ISO 27001 Kapitel 9.1 (kontinuierliche Wirksamkeitsbewertung von Maßnahmen).</span></li>\n<li><strong><span style=\"\">Excel-Export: </span></strong><span style=\"\">Gesamtexport oder gefiltert nach Status als .xlsx</span></li>\n<li><strong><span style=\"\">Status-Chart: </span></strong><span style=\"\">Kreisdiagramm der Maßnahmen nach Status</span></li>\n</ul>', '', '<p>Do&lt;Tos</p>'),
(7, 'aufgaben', 'Termine', '<h1>Aufgaben</h1>\n<h2 style=\"\"><span>Beschreibung</span></h2>\n<p class=\"MsoNormal\" style=\"\"><span style=\"\">Das Aufgaben-Modul löst ein praktisches Problem, das in verteilten ISMS-Systemen häufig auftritt: Fällige Termine und offene Aufgaben sind über mehrere Module verstreut und werden leicht übersehen. WolfISMS aggregiert alle termingebundenen Aktivitäten eines Benutzers aus sämtlichen Modulen an einem einzigen, übersichtlichen Ort.<span style=\"\">  </span>Im ISMS-Betrieb entstehen kontinuierlich fristgebundene Aufgaben: Maßnahmen mit Enddatum, regelmäßige Asset-Reviews (ISO 27001 A 5.9), Document-Reviews zur Aktualitätsprüfung, Risiko-Reviews (ISO 27001 Kapitel 8.2) und Lieferantenbewertungen (ISO 27001 A 5.19). Das Aufgaben-Modul stellt sicher, dass keine dieser Aktivitäten im operativen Alltag untergeht. Benutzer mit master-Berechtigung erhalten eine systemweite Übersicht aller Aufgaben aller Benutzer – unverzichtbar für ISMS-Manager und Auditoren.</span></p>\n<h2 style=\"\"><span>Funktionen</span></h2>\n<ul>\n<li><strong><span style=\"\">Zeitraum-Filter: </span></strong><span style=\"\">Pill-Tabs: Heute / 7 Tage / 30 Tage / 90 Tage / Alle</span></li>\n<li><strong><span style=\"\">Mein / Alle (master): </span></strong><span style=\"\">Umschalten zwischen eigenen Aufgaben und systemweiter Ansicht</span></li>\n<li><strong><span style=\"\">Offene Maßnahmen: </span></strong><span style=\"\">Maßnahmen mit Enddatum innerhalb des gewählten Zeitraums</span></li>\n<li><strong><span style=\"\">Reviews: </span></strong><span style=\"\">Fällige Reviews aus allen Modulen: Maßnahmen, Assets, Dokumente, Risiken, Lieferanten</span></li>\n<li><strong><span style=\"\">Dokument-Workflows: </span></strong><span style=\"\">Dokumente mit fälliger Prüfung oder ausstehender Freigabe</span></li>\n<li><strong><span style=\"\">Dringlichkeits-Badges: </span></strong><span style=\"\">Kennzeichnung nach Fälligkeitsstufe (heute / diese Woche / überfällig)</span></li>\n<li><strong><span style=\"\">Überfällige Einträge: </span></strong><span style=\"\">Vergangene Fälligkeitstermine werden rot hervorgehoben</span></li>\n<li><strong><span style=\"\">Bereichs-Tags: </span></strong><span style=\"\">Farbige Tags zeigen aus welchem Modul die Aufgabe stammt</span></li>\n</ul>', '', ''),
(8, 'audit', 'Audit', '<h1>Audit</h1>\n<h2 style=\"\"><span>Beschreibung</span></h2>\n<p class=\"MsoNormal\" style=\"\"><span style=\"\">Das Audit-Modul unterstützt die Durchführung interner Informationssicherheitsaudits, wie sie ISO/IEC 27001:2022 Kapitel 9.2 verbindlich fordert. Interne Audits dienen dazu, in regelmäßigen Abständen zu überprüfen, ob das ISMS konform mit den eigenen Anforderungen und den Normanforderungen betrieben wird und ob es wirksam ist.<span style=\"\">  </span>Die Grundlage bildet ein strukturierter Fragenkatalog, der die Kontrollanforderungen aller relevanten Normen in überprüfbare Fragen übersetzt. Jede Frage wird vom Auditor direkt im System bewertet (Erfüllt / Teilweise erfüllt / Offen), versehen mit einem Bewertungsdatum. Das System berechnet automatisch Erfüllungsgrade je Kapitel und für das ISMS insgesamt.<span style=\"\">  </span>Die Ergebnisse des internen Audits fließen als wesentlicher Input in das Management-Review (ISO 27001 Kapitel 9.3) ein und bilden die Grundlage für Korrekturmaßnahmen (Kapitel 10.1). Die Scoring-Logik unterscheidet zwischen Pflichtfragen (mit erhöhtem Gewicht) und optionalen Fragen, um kritische Kontrollen besonders hervorzuheben.</span></p>\n<h2 style=\"\"><span>Funktionen</span></h2>\n<ul>\n<li><strong><span style=\"\">Statistik-Kacheln: </span></strong><span style=\"\">Übersicht: Gesamtfragen, Pflichtfragen, Erfüllungsgrade</span></li>\n<li><strong><span style=\"\">Globaler Fortschrittsbalken: </span></strong><span style=\"\">Gesamterfüllungsgrad über alle Kapitel mit Ampelfarbe</span></li>\n<li><strong><span style=\"\">Kapitel-Tabelle: </span></strong><span style=\"\">Kapitelweise Übersicht mit farbigen Fortschrittsbalken</span></li>\n<li><strong><span style=\"\">Inline-Bewertung (audit): </span></strong><span style=\"\">Direkte Beantwortung der Fragen ohne Seitennavigation (Erfüllt/Teilweise/Offen)</span></li>\n<li><strong><span style=\"\">Pflichtfragen: </span></strong><span style=\"\">Pflichtfragen sind mit ★ gekennzeichnet und fließen stärker ins Scoring ein</span></li>\n<li><strong><span style=\"\">Scoring: </span></strong><span style=\"\">Das Scoring-System gewichtet vollständig erfüllte Anforderungen mit 2 Punkten und teilweise erfüllte mit 1 Punkt. Pflichtfragen fließen mit doppeltem Gewicht in die Berechnung ein. Der resultierende Gesamtscore wird als Prozentsatz des maximal erreichbaren Scores dargestellt. Farbschwellen: ab 80 % grün (audit-konform), 50–79 % gelb (Verbesserungsbedarf), unter 50 % rot (kritischer Handlungsbedarf). Diese Schwellenwerte orientieren sich an gängigen Reifegradmodellen für Informationssicherheit.</span></li>\n<li><strong><span style=\"\">Datum: </span></strong><span style=\"\">Bewertungsdatum je Frage erfassbar</span></li>\n<li><strong><span style=\"\">Excel-Export: </span></strong><span style=\"\">Vollständiger Audit-Export als .xlsx</span></li>\n<li><strong><span style=\"\">Charts: </span></strong><span style=\"\">Status-Kreisdiagramm und Kapitel-Balkendiagramm</span></li>\n</ul>', '', ''),
(9, 'normen', 'Normen', '<h1>Normen</h1>\n<h2 style=\"\"><span>Beschreibung</span></h2>\n<p class=\"MsoNormal\" style=\"\"><span style=\"\">Das Normen-Modul ist das zentrale Compliance-Werkzeug von WolfISMS und bildet das Rückgrat der gesamten Normerfüllung. Es spiegelt die vollständige Anforderungsstruktur aller hinterlegten Rahmenwerke – derzeit ISO/IEC 27001:2022, NIS-2-Richtlinie und BSI IT-Grundschutz – und ermöglicht die lückenlose Nachverfolgung des Umsetzungsstands je Anforderung.<span style=\"\">  </span>Im ISMS-Kontext ist die strukturierte Verwaltung von Normanforderungen unerlässlich: ISO 27001 verlangt in Kapitel 6.1.3 eine vollständige Statement of Applicability (SoA), also eine dokumentierte Aussage zu Anwendbarkeit und Umsetzungsstatus jeder Maßnahme. Das Normen-Modul liefert genau diese Grundlage. Durch die direkte Verknüpfung von Anforderungen mit Umsetzungsdokumenten und konkreten Maßnahmen entsteht ein durchgängiger Nachweis, der bei internen Audits, Management-Reviews und externen Zertifizierungsprüfungen unmittelbar abrufbar ist.<span style=\"\">  </span>Jede Norm ist in ihre Kapitel und einzelne Anforderungen untergliedert. Der Status jeder Anforderung (z. B. Umgesetzt, In Arbeit, Offen, Nicht anwendbar) wird direkt gepflegt und fließt in die Fortschrittsberechnung auf dem Dashboard ein.</span></p>\n<h2 style=\"\"><span>Funktionen</span></h2>\n<ul>\n<li><strong><span style=\"\">Norm-Kacheln: </span></strong><span style=\"\">Farbcodierte Kacheln pro hinterlegter Norm zeigen auf einen Blick die Gesamtanzahl der Anforderungen, den prozentualen Erfüllungsgrad und die Verteilung der Status-Kategorien. Die Farbgebung (ISO 27001 dunkelblau, NIS-2 lila, BSI dunkelrot) ermöglicht eine sofortige visuelle Zuordnung. Ein Klick auf eine Kachel filtert die darunter liegende Anforderungsliste auf diese Norm.</span></li>\n<li><strong><span style=\"\">Kapitelübersicht: </span></strong><span style=\"\">Strukturierte Tabelle aller Kapitel und Unterkapitel der ausgewählten Norm mit Angabe der Gesamtanzahl von Anforderungen, der Anzahl erfüllter Anforderungen sowie dem resultierenden Erfüllungsgrad in Prozent. Farbige Fortschrittsbalken ermöglichen einen schnellen Vergleich zwischen Kapiteln und helfen dabei, Schwerpunkte für anstehende Umsetzungsarbeiten zu identifizieren.</span></li>\n<li><strong><span style=\"\">Eintragslistle: </span></strong><span style=\"\">Vollständige, durchsuchbare Liste aller Normanforderungen mit kombinierbaren Filtern nach Norm, Kapitel, Status und Freitext. Pro Seite werden 40 Einträge angezeigt; über die Paginierung navigieren Benutzer durch längere Listen. Jede Zeile zeigt Nummer, Titel, zuständigen Reviewer und aktuellen Status auf einen Blick. Ein Klick öffnet die vollständige Detailansicht.</span></li>\n<li><strong><span style=\"\">Detailansicht: </span></strong><span style=\"\">Die Detailansicht einer Normanforderung zeigt den vollständigen Normtext, eine in WolfISMS hinterlegte Erläuterung sowie unternehmensspezifische Umsetzungshinweise im Richtext-Format. Zusätzlich werden der zuständige Reviewer, das letzte Änderungsdatum und die Änderungshistorie angezeigt. Verknüpfte Dokumente und Maßnahmen sind direkt verlinkt, sodass der Nachweis der Umsetzung unmittelbar zugänglich ist.</span></li>\n<li><strong><span style=\"\">Bearbeiten (norm): </span></strong><span style=\"\">Benutzer mit der Berechtigung norm können jede Anforderung bearbeiten: Status setzen (Umgesetzt / In Arbeit / Offen / Nicht anwendbar), unternehmensspezifische Umsetzungshinweise im integrierten TinyMCE-Richtext-Editor pflegen, Reviewer zuweisen und ein Prüfdatum hinterlegen. Alle Änderungen werden mit Benutzer und Zeitstempel protokolliert.</span></li>\n<li><strong><span style=\"\">Verknüpfen (norm): </span></strong><span style=\"\">Eine Normanforderung kann direkt mit beliebig vielen Dokumenten (aus dem Dokumentenmodul) und Maßnahmen (aus dem Maßnahmenmodul) verknüpft werden. Diese Verknüpfungen sind die Grundlage des Nachweissystems: Sie belegen, durch welche konkreten Maßnahmen und Richtlinien eine Anforderung erfüllt wird – unverzichtbar für das Statement of Applicability (SoA) und externe Audits.</span></li>\n<li><strong><span style=\"\">Excel-Export: </span></strong><span style=\"\">Exportiert alle Normanforderungen inklusive Kapitelnummer, Normtitel, Status, Reviewer, Umsetzungshinweisen und verknüpften Maßnahmen in eine strukturierte Excel-Datei (.xlsx). Der Export dient als Arbeitsgrundlage für Management-Reviews, externe Audits und Zertifizierungsvorbereitung gemäß ISO 27001.</span></li>\n<li><strong><span style=\"\">Charts: </span></strong><span style=\"\">Kreisdiagramme: ISO-27001-Status, NIS-2-Status, Gesamtstatus</span></li>\n</ul>\n<h1><span style=\"\">Rechtsregister</span></h1>\n<h2 style=\"\"><span>Beschreibung</span></h2>\n<p class=\"MsoNormal\" style=\"\"><span style=\"\">Das Rechtsregister ist ein zentrales Instrument der rechtlichen Compliance-Überwachung und entspricht der Anforderung aus ISO/IEC 27001:2022 Anhang A, Maßnahme 5.31 (Identifizierung rechtlicher, satzungsmäßiger, regulatorischer und vertraglicher Anforderungen) sowie 18.1 (Einhaltung gesetzlicher und vertraglicher Anforderungen).<span style=\"\">  </span>Organisationen sind verpflichtet, alle auf sie anwendbaren Rechtsvorschriften zu kennen, zu bewerten und deren Einhaltung nachzuweisen. Das Rechtsregister in WolfISMS erfüllt genau diese Anforderung: Es bietet eine strukturierte, durchsuchbare Datenbank aller relevanten Rechtsnormen, unterteilt nach Themenbereichen wie Datenschutz, Informationssicherheit, Luftfahrt oder Produkthaftung.<span style=\"\">  </span>Das Modul wird mit 48 vordefinierten Einträgen aus EU- und deutschem Recht ausgeliefert – darunter DSGVO, NIS-2, IT-Sicherheitsgesetz, HGB, Produktsicherheitsgesetz und branchenspezifische Regularien. Diese Einträge können unternehmensspezifisch ergänzt, bearbeitet und mit einem Compliance-Status versehen werden.</span></p>\n<h2 style=\"\"><span>Funktionen</span></h2>\n<ul>\n<li><strong><span style=\"\">Übersicht: </span></strong><span style=\"\">Vollständige, durchsuchbare Liste aller Einträge im Rechtsregister mit kombinierbaren Filtern nach Themenbereich (z. B. Datenschutz, Informationssicherheit, Luftfahrt), Kürzel, Status (Konform / In Arbeit / Offen / N.A.) und Freitext. Jede Zeile zeigt Kurzbezeichnung, Rechtsgrundlage, Zuständigkeit und aktuellen Status für eine schnelle Übersicht.</span></li>\n<li><strong><span style=\"\">Detailansicht: </span></strong><span style=\"\">Die Detailansicht eines Eintrags zeigt den vollständigen Namen der Rechtsgrundlage, die konkreten Anforderungen an die Organisation, die zuständige Abteilung oder Person, das letzte Prüfdatum, den aktuellen Compliance-Status sowie unternehmensspezifische Umsetzungsnotizen im Richtext-Format. Alle relevanten Informationen zur Compliance-Nachweisführung sind auf einer Seite zusammengefasst.</span></li>\n<li><strong><span style=\"\">Neu / Bearbeiten (norm): </span></strong><span style=\"\">Über das Bearbeitungsformular können neue Rechtsanforderungen angelegt oder bestehende aktualisiert werden. Felder umfassen: Kürzel, vollständiger Name, Themenbereich, Anforderungsbeschreibung, Zuständigkeit, Prüfdatum und Status. Der Status (Konform / In Arbeit / Offen / Nicht anwendbar) gibt jederzeit Auskunft über den aktuellen Compliance-Stand je Vorschrift.</span></li>\n<li><strong><span style=\"\">Themenbereichs-Kacheln: </span></strong><span style=\"\">Schnellfilter nach Themenbereich (z.B. Datenschutz, Informationssicherheit, Luftfahrt)</span></li>\n<li><strong><span style=\"\">Status-Chart: </span></strong><span style=\"\">Kreisdiagramm der Compliance-Status-Verteilung</span></li>\n<li><strong><span style=\"\">Excel-Export: </span></strong><span style=\"\">Export aller Einträge als .xlsx</span></li>\n<li><strong><span style=\"\">DB-Setup (admin): </span></strong><span style=\"\">Erstellt die Datenbanktabelle beim Erststart automatisch</span></li>\n</ul>\n<p> </p>', '', ''),
(10, 'user', 'Benutzer', '<p><span style=\"\"><strong>Lizenzvereinbarung für WolfISMS (Subscription-Modell)</strong></span></p>\r\n<h1 class=\"western\">1. Präambel</h1>\r\n<p>Diese Lizenzvereinbarung regelt die Nutzung der Software WolfISMS (nachfolgend „Software“) durch den Lizenznehmer.</p>\r\n<p>WolfISMS ist ein proprietäres Informationssicherheits-Management-System zur Unterstützung von Governance-, Risiko- und Compliance-Prozessen (u. a. ISO/IEC 27001, NIS2, BSI-Grundschutz).</p>\r\n<p>Die Software ist urheberrechtlich geschützt und wird nicht als Open-Source-Software bereitgestellt.</p>\r\n<h1 class=\"western\">2. Lizenzgeber</h1>\r\n<p>WolfInfoSec Wolfgang Schuster</p>\r\n<p>Inhaber: Wolfgang Schuster</p>\r\n<p>Deutschland</p>\r\n<p>(nachfolgend „Lizenzgeber“)</p>\r\n<p>Die Software kann sowohl direkt vom Lizenzgeber als auch über einen vom Lizenzgeber autorisierten Vertriebspartner (nachfolgend „Partner“) bezogen werden. Das Nutzungsrecht an der Software wird in beiden Fällen unmittelbar durch diese Lizenzvereinbarung zwischen Lizenzgeber und Lizenznehmer begründet; die kommerzielle Abwicklung (Bestellung, Rechnungsstellung, ggf. Hosting) kann hiervon unabhängig über den Partner erfolgen. Rechte und Pflichten zwischen Lizenzgeber und Partner richten sich nach einem gesonderten Vertriebspartnervertrag.</p>\r\n<h1 class=\"western\">3. Vertragsgegenstand</h1>\r\n<p>Gegenstand dieser Vereinbarung ist die Überlassung von Nutzungsrechten an der Software WolfISMS im Rahmen eines zeitlich befristeten Abonnements (Subscription), einschließlich zugehöriger Module, Datenbankstrukturen, Benutzeroberflächen sowie der zur Nutzung erforderlichen Dokumentation.</p>\r\n<h1 class=\"western\">4. Art der Lizenz</h1>\r\n<p>Der Lizenzgeber räumt dem Lizenznehmer eine:</p>\r\n<ul>\r\n<li>\r\n<p>nicht ausschließliche</p>\r\n</li>\r\n<li>\r\n<p>nicht übertragbare</p>\r\n</li>\r\n<li>\r\n<p>nicht unterlizenzierbare</p>\r\n</li>\r\n</ul>\r\n<p>Lizenz zur Nutzung der Software ein.</p>\r\n<p>Die Lizenz gilt ausschließlich für den internen Einsatz im Unternehmen des Lizenznehmers und nur im Rahmen einer gültigen Subscription.</p>\r\n<h1 class=\"western\">5. Umfang der Nutzung</h1>\r\n<p>Sofern nicht ausdrücklich schriftlich anders vereinbart, ist der Lizenznehmer berechtigt:</p>\r\n<ul>\r\n<li>\r\n<p>die Software intern zu betreiben (On-Premise oder Hosting nach Vereinbarung),</p>\r\n</li>\r\n<li>\r\n<p>die Software für eigene ISMS-, GRC- und Compliance-Zwecke zu nutzen,</p>\r\n</li>\r\n<li>\r\n<p>interne Benutzerkonten im Rahmen der gebuchten Lizenzparameter (z. B. Edition, Benutzeranzahl) anzulegen,</p>\r\n</li>\r\n<li>\r\n<p>die Software durch einen vom Lizenzgeber autorisierten Partner betreiben bzw. hosten zu lassen (autorisiertes Hosting).</p>\r\n</li>\r\n</ul>\r\n<p>Nicht gestattet ist insbesondere:</p>\r\n<ul>\r\n<li>\r\n<p>die entgeltliche oder unentgeltliche Weitergabe an Dritte, die nicht vom Lizenzgeber als Partner autorisiert sind,</p>\r\n</li>\r\n<li>\r\n<p>der Betrieb als SaaS-, Cloud- oder Mandantenlösung für externe Organisationen durch den Lizenznehmer selbst oder durch nicht autorisierte Dritte,</p>\r\n</li>\r\n<li>\r\n<p>das Anbieten der Software oder von Teilen davon als eigenes Produkt oder als eigene Dienstleistung durch den Lizenznehmer oder nicht autorisierte Dritte.</p>\r\n</li>\r\n</ul>\r\n<p>Ein „autorisierter Partner“ im Sinne dieser Vereinbarung ist ausschließlich ein Vertriebspartner, mit dem der Lizenzgeber einen gültigen Vertriebspartnervertrag geschlossen hat, der ihn zum Vertrieb und/oder Hosting der Software berechtigt. Erfolgt das Hosting durch einen autorisierten Partner oder den Lizenzgeber und werden dabei personenbezogene Daten des Lizenznehmers verarbeitet, ist zwischen dem Lizenznehmer und der hostenden Stelle vor Aufnahme der Verarbeitung ein Auftragsverarbeitungsvertrag gemäß Art. 28 DSGVO abzuschließen. Ohne einen solchen Auftragsverarbeitungsvertrag darf keine Verarbeitung personenbezogener Daten im Rahmen des Hostings erfolgen.</p>\r\n<h1 class=\"western\">6. Subscription, Vergütung und Zahlungsbedingungen</h1>\r\n<p>Die Nutzung der Software ist kostenpflichtig und erfolgt ausschließlich im Rahmen einer Subscription.</p>\r\n<p>Art, Umfang, Laufzeit und Höhe der Vergütung ergeben sich aus:</p>\r\n<ul>\r\n<li>\r\n<p>einem separaten Lizenz- oder Subscription-Vertrag,</p>\r\n</li>\r\n<li>\r\n<p>einem Angebot oder</p>\r\n</li>\r\n<li>\r\n<p>einer gültigen Preisliste des Lizenzgebers.</p>\r\n</li>\r\n</ul>\r\n<p>Die Subscription ist im Voraus für den jeweiligen Abrechnungszeitraum zu bezahlen.</p>\r\n<p>Ohne gültige Subscription und vollständigen Zahlungseingang besteht kein Anspruch auf Updates oder Support.</p>\r\n<h1 class=\"western\">7. Updates und Weiterentwicklung</h1>\r\n<p>Während einer aktiven Subscription erhält der Lizenznehmer Zugriff auf:</p>\r\n<ul>\r\n<li>\r\n<p>Fehlerbehebungen (Bugfixes),</p>\r\n</li>\r\n<li>\r\n<p>kleinere Verbesserungen und Weiterentwicklungen,</p>\r\n</li>\r\n<li>\r\n<p>neue Versionen der Software im Rahmen der gebuchten Edition.</p>\r\n</li>\r\n</ul>\r\n<p>Ein Anspruch auf bestimmte Funktionen, Erweiterungen oder individuelle Weiterentwicklungen besteht nicht.</p>\r\n<p>Nach Beendigung der Subscription werden keine Updates mehr bereitgestellt.</p>\r\n<h1 class=\"western\">8. Supportleistungen</h1>\r\n<p>Supportleistungen werden ausschließlich während einer aktiven Subscription erbracht.</p>\r\n<p>Der Support umfasst ausschließlich:</p>\r\n<ul>\r\n<li>\r\n<p>Unterstützung bei der Bedienung der Software,</p>\r\n</li>\r\n<li>\r\n<p>Unterstützung bei der Installation und technischen Einrichtung.</p>\r\n</li>\r\n</ul>\r\n<p>Der Support umfasst nicht:</p>\r\n<ul>\r\n<li>\r\n<p>Beratung zur Informationssicherheit im Allgemeinen,</p>\r\n</li>\r\n<li>\r\n<p>Interpretation oder Umsetzung von Normen (z. B. ISO/IEC 27001, NIS2, BSI-Grundschutz),</p>\r\n</li>\r\n<li>\r\n<p>fachliche oder organisatorische ISMS-Beratung.</p>\r\n</li>\r\n</ul>\r\n<p>Weitergehende Support- oder Beratungsleistungen bedürfen einer gesonderten Vereinbarung.</p>\r\n<h1 class=\"western\">9. Betrieb nach Ende der Subscription</h1>\r\n<p>Nach Beendigung der Subscription ist der Lizenznehmer berechtigt, die zuletzt bereitgestellte Version der Software ohne Updates und ohne Support weiter zu betreiben.</p>\r\n<p>Der Weiterbetrieb erfolgt:</p>\r\n<ul>\r\n<li>\r\n<p>auf eigene Verantwortung des Lizenznehmers,</p>\r\n</li>\r\n<li>\r\n<p>ohne Anspruch auf Fehlerbehebungen, Sicherheitsupdates oder Weiterentwicklungen,</p>\r\n</li>\r\n<li>\r\n<p>ohne jegliche Haftung des Lizenzgebers für daraus resultierende Schäden.</p>\r\n</li>\r\n</ul>\r\n<h1 class=\"western\">10. Urheber- und Schutzrechte</h1>\r\n<p>Alle Rechte an der Software, insbesondere an:</p>\r\n<ul>\r\n<li>\r\n<p>Quellcode und Objektcode,</p>\r\n</li>\r\n<li>\r\n<p>Datenbankdesign und Strukturen,</p>\r\n</li>\r\n<li>\r\n<p>Benutzeroberflächen,</p>\r\n</li>\r\n<li>\r\n<p>Konzepten, Methoden und Logiken,</p>\r\n</li>\r\n</ul>\r\n<p>verbleiben ausschließlich beim Lizenzgeber.</p>\r\n<p>Der Lizenznehmer erwirbt kein Eigentum an der Software, sondern lediglich ein Nutzungsrecht im vereinbarten Umfang.</p>\r\n<h1 class=\"western\">11. Verbotene Handlungen</h1>\r\n<p>Dem Lizenznehmer ist es untersagt:</p>\r\n<ul>\r\n<li>\r\n<p>die Software zu dekompilieren, zu disassemblieren oder zurückzuentwickeln (Reverse Engineering),</p>\r\n</li>\r\n<li>\r\n<p>Quellcode ganz oder teilweise zu verändern oder offenzulegen,</p>\r\n</li>\r\n<li>\r\n<p>Lizenz-, Copyright- oder Schutzvermerke zu entfernen,</p>\r\n</li>\r\n<li>\r\n<p>Sicherheits- oder Lizenzmechanismen zu umgehen.</p>\r\n</li>\r\n</ul>\r\n<h1 class=\"western\">12. Anpassungen und Erweiterungen</h1>\r\n<p>Individuelle Anpassungen, Erweiterungen oder Integrationen:</p>\r\n<ul>\r\n<li>\r\n<p>bedürfen der Zustimmung des Lizenzgebers,</p>\r\n</li>\r\n<li>\r\n<p>können gesondert vergütet werden,</p>\r\n</li>\r\n<li>\r\n<p>begründen keine Miturheberschaft des Lizenznehmers.</p>\r\n</li>\r\n</ul>\r\n<p>Sofern nichts anderes vereinbart ist, verbleiben alle daraus entstehenden Rechte beim Lizenzgeber.</p>\r\n<h1 class=\"western\">13. Gewährleistung</h1>\r\n<p>Die Software wird in dem Zustand bereitgestellt, der dem aktuellen Entwicklungsstand entspricht („as is“).</p>\r\n<p>Der Lizenzgeber übernimmt insbesondere keine Gewähr dafür, dass:</p>\r\n<ul>\r\n<li>\r\n<p>die Software fehlerfrei ist,</p>\r\n</li>\r\n<li>\r\n<p>sie jederzeit verfügbar ist,</p>\r\n</li>\r\n<li>\r\n<p>sie allen individuellen rechtlichen oder organisatorischen Anforderungen des Lizenznehmers entspricht.</p>\r\n</li>\r\n</ul>\r\n<h1 class=\"western\">14. Haftung</h1>\r\n<p>Der Lizenzgeber haftet unbeschränkt bei Vorsatz und grober Fahrlässigkeit sowie nach den Vorschriften des Produkthaftungsgesetzes. Ebenso unbeschränkt haftet der Lizenzgeber bei der Verletzung des Lebens, des Körpers oder der Gesundheit, unabhängig vom Grad des Verschuldens.</p>\r\n<p>Bei leicht fahrlässiger Verletzung wesentlicher Vertragspflichten (Kardinalpflichten), deren Erfüllung die ordnungsgemäße Durchführung des Vertrags überhaupt erst ermöglicht und auf deren Einhaltung der Lizenznehmer regelmäßig vertrauen darf, ist die Haftung des Lizenzgebers der Höhe nach auf den bei Vertragsschluss vorhersehbaren, vertragstypischen Schaden begrenzt.</p>\r\n<p>Im Übrigen ist eine Haftung des Lizenzgebers für leichte Fahrlässigkeit ausgeschlossen, insbesondere für mittelbare Schäden, entgangenen Gewinn und Datenverlust, soweit gesetzlich zulässig.</p>\r\n<p>Für Schäden, die im Rahmen eines von einem autorisierten Partner erbrachten Hostings entstehen, haftet der Lizenzgeber nicht, soweit die Ursache im Verantwortungsbereich des Partners liegt; insoweit haftet der Partner gemäß dem zwischen ihm und dem Lizenznehmer bestehenden Vertragsverhältnis.</p>\r\n<h1 class=\"western\">15. Vertraulichkeit</h1>\r\n<p>Der Lizenznehmer verpflichtet sich, alle ihm im Zusammenhang mit der Software bekannt gewordenen nicht-öffentlichen Informationen vertraulich zu behandeln.</p>\r\n<h1 class=\"western\">16. Anwendbares Recht und Gerichtsstand</h1>\r\n<p>Es gilt das Recht der Bundesrepublik Deutschland unter Ausschluss des UN-Kaufrechts (CISG).</p>\r\n<p>Ist der Lizenznehmer Kaufmann im Sinne des Handelsgesetzbuchs, juristische Person des öffentlichen Rechts oder öffentlich-rechtliches Sondervermögen, ist Gerichtsstand für alle Streitigkeiten aus oder im Zusammenhang mit dieser Vereinbarung der Sitz des Lizenzgebers. Gegenüber Verbrauchern gelten die gesetzlichen Gerichtsstandsregelungen.</p>\r\n<h1 class=\"western\">17. Schlussbestimmungen</h1>\r\n<p>Änderungen und Ergänzungen dieser Vereinbarung bedürfen der Textform. Dies gilt auch für einen Verzicht auf dieses Formerfordernis.</p>\r\n<p>Sollten einzelne Bestimmungen dieser Vereinbarung unwirksam sein oder werden, bleibt die Wirksamkeit der übrigen Regelungen unberührt.</p>\r\n<p><em>© WolfInfoSec Wolfgang Schuster – Alle Rechte vorbehalten</em></p>', '', '');
INSERT INTO `ismshilfe` (`id`, `seite`, `name`, `Text`, `name_en`, `text_en`) VALUES
(11, 'help', 'Hilfe', '<h1 data-start=\"183\" data-end=\"256\">Informationssicherheits-Managementsystem (ISMS) &ndash; Allgemeine Einf&uuml;hrung</h1>\r\n<h2 data-start=\"258\" data-end=\"278\">Was ist ein ISMS?</h2>\r\n<p data-start=\"280\" data-end=\"566\">Ein Informationssicherheits-Managementsystem (ISMS) ist ein <strong data-start=\"340\" data-end=\"381\">systematischer, strukturierter Ansatz</strong>, um Informationen und informationsverarbeitende Systeme <strong data-start=\"438\" data-end=\"464\">angemessen zu sch&uuml;tzen</strong>.<br data-start=\"465\" data-end=\"468\">Ziel ist es, Risiken f&uuml;r Informationen <strong data-start=\"507\" data-end=\"565\">kontinuierlich zu erkennen, zu bewerten und zu steuern</strong>.</p>\r\n<p data-start=\"568\" data-end=\"694\">Ein ISMS betrachtet Informationssicherheit <strong data-start=\"611\" data-end=\"627\">ganzheitlich</strong> &ndash; nicht nur technisch, sondern auch organisatorisch und personell.</p>\r\n<hr data-start=\"696\" data-end=\"699\">\r\n<h2 data-start=\"701\" data-end=\"720\">Ziele eines ISMS</h2>\r\n<p data-start=\"722\" data-end=\"778\">Ein wirksames ISMS verfolgt insbesondere folgende Ziele:</p>\r\n<ul data-start=\"780\" data-end=\"1216\">\r\n<li data-start=\"780\" data-end=\"824\">\r\n<p data-start=\"782\" data-end=\"824\">Schutz von Informationen und IT-Systemen</p>\r\n</li>\r\n<li data-start=\"825\" data-end=\"1009\">\r\n<p data-start=\"827\" data-end=\"847\">Sicherstellung von</p>\r\n<ul data-start=\"850\" data-end=\"1009\">\r\n<li data-start=\"850\" data-end=\"903\">\r\n<p data-start=\"852\" data-end=\"903\"><strong data-start=\"852\" data-end=\"871\">Vertraulichkeit</strong> (Zugriff nur f&uuml;r Berechtigte)</p>\r\n</li>\r\n<li data-start=\"906\" data-end=\"958\">\r\n<p data-start=\"908\" data-end=\"958\"><strong data-start=\"908\" data-end=\"922\">Integrit&auml;t</strong> (Richtigkeit und Vollst&auml;ndigkeit)</p>\r\n</li>\r\n<li data-start=\"961\" data-end=\"1009\">\r\n<p data-start=\"963\" data-end=\"1009\"><strong data-start=\"963\" data-end=\"980\">Verf&uuml;gbarkeit</strong> (rechtzeitige Nutzbarkeit)</p>\r\n</li>\r\n</ul>\r\n</li>\r\n<li data-start=\"1010\" data-end=\"1086\">\r\n<p data-start=\"1012\" data-end=\"1086\">Einhaltung gesetzlicher, regulatorischer und vertraglicher Anforderungen</p>\r\n</li>\r\n<li data-start=\"1087\" data-end=\"1139\">\r\n<p data-start=\"1089\" data-end=\"1139\">Reduzierung von Sicherheitsvorf&auml;llen und Sch&auml;den</p>\r\n</li>\r\n<li data-start=\"1140\" data-end=\"1216\">\r\n<p data-start=\"1142\" data-end=\"1216\">Transparenz und Nachweisbarkeit gegen&uuml;ber Management, Kunden und Pr&uuml;fern</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1218\" data-end=\"1221\">\r\n<h2 data-start=\"1223\" data-end=\"1254\">Warum ein ISMS notwendig ist</h2>\r\n<p data-start=\"1256\" data-end=\"1385\">Informationssicherheit ist heute ein <strong data-start=\"1293\" data-end=\"1321\">kritischer Erfolgsfaktor</strong>.<br data-start=\"1322\" data-end=\"1325\">Organisationen stehen u. a. vor folgenden Herausforderungen:</p>\r\n<ul data-start=\"1387\" data-end=\"1586\">\r\n<li data-start=\"1387\" data-end=\"1418\">\r\n<p data-start=\"1389\" data-end=\"1418\">Zunehmende Cyberbedrohungen</p>\r\n</li>\r\n<li data-start=\"1419\" data-end=\"1461\">\r\n<p data-start=\"1421\" data-end=\"1461\">Steigende regulatorische Anforderungen</p>\r\n</li>\r\n<li data-start=\"1462\" data-end=\"1495\">\r\n<p data-start=\"1464\" data-end=\"1495\">Komplexe IT- und Lieferketten</p>\r\n</li>\r\n<li data-start=\"1496\" data-end=\"1536\">\r\n<p data-start=\"1498\" data-end=\"1536\">Abh&auml;ngigkeit von digitalen Prozessen</p>\r\n</li>\r\n<li data-start=\"1537\" data-end=\"1586\">\r\n<p data-start=\"1539\" data-end=\"1586\">Hohe Anforderungen an Nachweis und Compliance</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"1588\" data-end=\"1711\">Ein ISMS sorgt daf&uuml;r, dass Informationssicherheit <strong data-start=\"1638\" data-end=\"1656\">nicht zuf&auml;llig</strong>, sondern <strong data-start=\"1666\" data-end=\"1702\">geplant, gesteuert und &uuml;berpr&uuml;ft</strong> erfolgt.</p>\r\n<hr data-start=\"1713\" data-end=\"1716\">\r\n<h2 data-start=\"1718\" data-end=\"1747\">Grundprinzipien eines ISMS</h2>\r\n<p data-start=\"1749\" data-end=\"1788\">Ein ISMS basiert auf klaren Prinzipien:</p>\r\n<ul data-start=\"1790\" data-end=\"2168\">\r\n<li data-start=\"1790\" data-end=\"1884\">\r\n<p data-start=\"1792\" data-end=\"1884\"><strong data-start=\"1792\" data-end=\"1814\">Risikoorientierung</strong><br data-start=\"1814\" data-end=\"1817\">Sicherheitsma&szlig;nahmen werden dort umgesetzt, wo sie notwendig sind</p>\r\n</li>\r\n<li data-start=\"1886\" data-end=\"1966\">\r\n<p data-start=\"1888\" data-end=\"1966\"><strong data-start=\"1888\" data-end=\"1910\">Verantwortlichkeit</strong><br data-start=\"1910\" data-end=\"1913\">Rollen und Zust&auml;ndigkeiten sind eindeutig definiert</p>\r\n</li>\r\n<li data-start=\"1968\" data-end=\"2074\">\r\n<p data-start=\"1970\" data-end=\"2074\"><strong data-start=\"1970\" data-end=\"2005\">Dokumentation &amp; Nachweisbarkeit</strong><br data-start=\"2005\" data-end=\"2008\">Entscheidungen und Umsetzungen sind nachvollziehbar dokumentiert</p>\r\n</li>\r\n<li data-start=\"2076\" data-end=\"2168\">\r\n<p data-start=\"2078\" data-end=\"2168\"><strong data-start=\"2078\" data-end=\"2110\">Kontinuierliche Verbesserung</strong><br data-start=\"2110\" data-end=\"2113\">Informationssicherheit entwickelt sich laufend weiter</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"2170\" data-end=\"2173\">\r\n<h2 data-start=\"2175\" data-end=\"2204\">Der ISMS-Regelkreis (PDCA)</h2>\r\n<p data-start=\"2206\" data-end=\"2301\">Ein ISMS folgt einem kontinuierlichen Verbesserungsprozess, h&auml;ufig dargestellt als PDCA-Zyklus:</p>\r\n<ul data-start=\"2303\" data-end=\"2565\">\r\n<li data-start=\"2303\" data-end=\"2372\">\r\n<p data-start=\"2305\" data-end=\"2372\"><strong data-start=\"2305\" data-end=\"2313\">Plan</strong><br data-start=\"2313\" data-end=\"2316\">Ziele festlegen, Risiken analysieren, Ma&szlig;nahmen planen</p>\r\n</li>\r\n<li data-start=\"2374\" data-end=\"2426\">\r\n<p data-start=\"2376\" data-end=\"2426\"><strong data-start=\"2376\" data-end=\"2382\">Do</strong><br data-start=\"2382\" data-end=\"2385\">Ma&szlig;nahmen umsetzen, Prozesse etablieren</p>\r\n</li>\r\n<li data-start=\"2428\" data-end=\"2503\">\r\n<p data-start=\"2430\" data-end=\"2503\"><strong data-start=\"2430\" data-end=\"2439\">Check</strong><br data-start=\"2439\" data-end=\"2442\">Wirksamkeit pr&uuml;fen, Audits durchf&uuml;hren, Kennzahlen bewerten</p>\r\n</li>\r\n<li data-start=\"2505\" data-end=\"2565\">\r\n<p data-start=\"2507\" data-end=\"2565\"><strong data-start=\"2507\" data-end=\"2514\">Act</strong><br data-start=\"2514\" data-end=\"2517\">Verbesserungen ableiten, Anpassungen vornehmen</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"2567\" data-end=\"2642\">Dieser Zyklus stellt sicher, dass das ISMS <strong data-start=\"2610\" data-end=\"2634\">lebendig und aktuell</strong> bleibt.</p>\r\n<hr data-start=\"2644\" data-end=\"2647\">\r\n<h2 data-start=\"2649\" data-end=\"2681\">Zentrale Bausteine eines ISMS</h2>\r\n<p data-start=\"2683\" data-end=\"2747\">Ein ISMS besteht aus mehreren miteinander verkn&uuml;pften Bereichen:</p>\r\n<ul data-start=\"2749\" data-end=\"3260\">\r\n<li data-start=\"2749\" data-end=\"2806\">\r\n<p data-start=\"2751\" data-end=\"2806\"><strong data-start=\"2751\" data-end=\"2778\">Dokumente &amp; Richtlinien</strong> &ndash; Vorgaben und Regelwerke</p>\r\n</li>\r\n<li data-start=\"2807\" data-end=\"2861\">\r\n<p data-start=\"2809\" data-end=\"2861\"><strong data-start=\"2809\" data-end=\"2819\">Assets</strong> &ndash; sch&uuml;tzenswerte Werte der Organisation</p>\r\n</li>\r\n<li data-start=\"2862\" data-end=\"2910\">\r\n<p data-start=\"2864\" data-end=\"2910\"><strong data-start=\"2864\" data-end=\"2875\">Risiken</strong> &ndash; Bedrohungen und Schwachstellen</p>\r\n</li>\r\n<li data-start=\"2911\" data-end=\"2974\">\r\n<p data-start=\"2913\" data-end=\"2974\"><strong data-start=\"2913\" data-end=\"2926\">Ma&szlig;nahmen</strong> &ndash; konkrete Schutz- und Verbesserungsma&szlig;nahmen</p>\r\n</li>\r\n<li data-start=\"2975\" data-end=\"3033\">\r\n<p data-start=\"2977\" data-end=\"3033\"><strong data-start=\"2977\" data-end=\"3002\">Lieferantenmanagement</strong> &ndash; Steuerung externer Risiken</p>\r\n</li>\r\n<li data-start=\"3034\" data-end=\"3100\">\r\n<p data-start=\"3036\" data-end=\"3100\"><strong data-start=\"3036\" data-end=\"3058\">Personalmanagement</strong> &ndash; Rollen, Schulung und Sensibilisierung</p>\r\n</li>\r\n<li data-start=\"3101\" data-end=\"3163\">\r\n<p data-start=\"3103\" data-end=\"3163\"><strong data-start=\"3103\" data-end=\"3114\">Termine</strong> &ndash; Fristen, Reviews und wiederkehrende Aufgaben</p>\r\n</li>\r\n<li data-start=\"3164\" data-end=\"3209\">\r\n<p data-start=\"3166\" data-end=\"3209\"><strong data-start=\"3166\" data-end=\"3176\">Audits</strong> &ndash; &Uuml;berpr&uuml;fung und Verbesserung</p>\r\n</li>\r\n<li data-start=\"3210\" data-end=\"3260\">\r\n<p data-start=\"3212\" data-end=\"3260\"><strong data-start=\"3212\" data-end=\"3222\">Normen</strong> &ndash; externe und interne Anforderungen</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"3262\" data-end=\"3327\">Diese Bausteine greifen ineinander und bilden gemeinsam das ISMS.</p>\r\n<hr data-start=\"3329\" data-end=\"3332\">\r\n<h2 data-start=\"3334\" data-end=\"3369\">Rollen und Verantwortung im ISMS</h2>\r\n<p data-start=\"3371\" data-end=\"3436\">Ein ISMS ist eine <strong data-start=\"3389\" data-end=\"3413\">Gemeinschaftsaufgabe</strong>. Typische Rollen sind:</p>\r\n<ul data-start=\"3438\" data-end=\"3771\">\r\n<li data-start=\"3438\" data-end=\"3497\">\r\n<p data-start=\"3440\" data-end=\"3497\"><strong data-start=\"3440\" data-end=\"3454\">Management</strong><br data-start=\"3454\" data-end=\"3457\">Verantwortung, Zielvorgaben, Freigaben</p>\r\n</li>\r\n<li data-start=\"3499\" data-end=\"3611\">\r\n<p data-start=\"3501\" data-end=\"3611\"><strong data-start=\"3501\" data-end=\"3552\">Informationssicherheitsbeauftragte (ISB / CISO)</strong><br data-start=\"3552\" data-end=\"3555\">Steuerung, Koordination und Weiterentwicklung des ISMS</p>\r\n</li>\r\n<li data-start=\"3613\" data-end=\"3694\">\r\n<p data-start=\"3615\" data-end=\"3694\"><strong data-start=\"3615\" data-end=\"3647\">Fach- und IT-Verantwortliche</strong><br data-start=\"3647\" data-end=\"3650\">Umsetzung von Ma&szlig;nahmen in ihren Bereichen</p>\r\n</li>\r\n<li data-start=\"3696\" data-end=\"3771\">\r\n<p data-start=\"3698\" data-end=\"3771\"><strong data-start=\"3698\" data-end=\"3715\">Mitarbeitende</strong><br data-start=\"3715\" data-end=\"3718\">Einhaltung der Sicherheitsvorgaben im Arbeitsalltag</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"3773\" data-end=\"3776\">\r\n<h2 data-start=\"3778\" data-end=\"3811\">ISMS als Teil der Organisation</h2>\r\n<p data-start=\"3813\" data-end=\"3866\">Ein ISMS ist <strong data-start=\"3826\" data-end=\"3856\">kein isoliertes IT-Projekt</strong>, sondern:</p>\r\n<ul data-start=\"3868\" data-end=\"4010\">\r\n<li data-start=\"3868\" data-end=\"3900\">\r\n<p data-start=\"3870\" data-end=\"3900\">Teil der Unternehmensf&uuml;hrung</p>\r\n</li>\r\n<li data-start=\"3901\" data-end=\"3931\">\r\n<p data-start=\"3903\" data-end=\"3931\">Unterst&uuml;tzt Gesch&auml;ftsziele</p>\r\n</li>\r\n<li data-start=\"3932\" data-end=\"3974\">\r\n<p data-start=\"3934\" data-end=\"3974\">Integriert sich in bestehende Prozesse</p>\r\n</li>\r\n<li data-start=\"3975\" data-end=\"4010\">\r\n<p data-start=\"3977\" data-end=\"4010\">W&auml;chst mit der Organisation mit</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"4012\" data-end=\"4084\">Ein gut eingef&uuml;hrtes ISMS erh&ouml;ht nicht nur die Sicherheit, sondern auch:</p>\r\n<ul data-start=\"4085\" data-end=\"4131\">\r\n<li data-start=\"4085\" data-end=\"4098\">\r\n<p data-start=\"4087\" data-end=\"4098\">Stabilit&auml;t,</p>\r\n</li>\r\n<li data-start=\"4099\" data-end=\"4111\">\r\n<p data-start=\"4101\" data-end=\"4111\">Vertrauen,</p>\r\n</li>\r\n<li data-start=\"4112\" data-end=\"4131\">\r\n<p data-start=\"4114\" data-end=\"4131\">Professionalit&auml;t.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"4133\" data-end=\"4136\">\r\n<h2 data-start=\"4138\" data-end=\"4166\">Rolle dieses ISMS-Portals</h2>\r\n<p data-start=\"4168\" data-end=\"4224\">Dieses ISMS-Portal dient als <strong data-start=\"4197\" data-end=\"4219\">zentrale Plattform</strong> zur:</p>\r\n<ul data-start=\"4226\" data-end=\"4400\">\r\n<li data-start=\"4226\" data-end=\"4263\">\r\n<p data-start=\"4228\" data-end=\"4263\">Dokumentation aller ISMS-Elemente</p>\r\n</li>\r\n<li data-start=\"4264\" data-end=\"4303\">\r\n<p data-start=\"4266\" data-end=\"4303\">Steuerung von Risiken und Ma&szlig;nahmen</p>\r\n</li>\r\n<li data-start=\"4304\" data-end=\"4351\">\r\n<p data-start=\"4306\" data-end=\"4351\">Erf&uuml;llung von Norm- und Audit-Anforderungen</p>\r\n</li>\r\n<li data-start=\"4352\" data-end=\"4400\">\r\n<p data-start=\"4354\" data-end=\"4400\">Transparenz f&uuml;r Management und Mitarbeitende</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"4402\" data-end=\"4501\">Die Hilfeseiten unterst&uuml;tzen dabei, das ISMS <strong data-start=\"4447\" data-end=\"4490\">verst&auml;ndlich, einheitlich und effizient</strong> zu nutzen.</p>\r\n<hr data-start=\"4503\" data-end=\"4506\">\r\n<p data-start=\"4508\" data-end=\"4559\"><strong data-start=\"4511\" data-end=\"4559\">Empfohlene n&auml;chste Schritte f&uuml;r neue Nutzer:</strong></p>\r\n<ol data-start=\"4560\" data-end=\"4766\">\r\n<li data-start=\"4560\" data-end=\"4617\">\r\n<p data-start=\"4563\" data-end=\"4617\">&Uuml;berblick &uuml;ber Dokumente und Richtlinien verschaffen</p>\r\n</li>\r\n<li data-start=\"4618\" data-end=\"4660\">\r\n<p data-start=\"4621\" data-end=\"4660\">Relevante Assets pr&uuml;fen oder erfassen</p>\r\n</li>\r\n<li data-start=\"4661\" data-end=\"4696\">\r\n<p data-start=\"4664\" data-end=\"4696\">Risiken verstehen und bewerten</p>\r\n</li>\r\n<li data-start=\"4697\" data-end=\"4733\">\r\n<p data-start=\"4700\" data-end=\"4733\">Ma&szlig;nahmen und Termine verfolgen</p>\r\n</li>\r\n<li data-start=\"4734\" data-end=\"4766\">\r\n<p data-start=\"4737\" data-end=\"4766\">Eigene Rolle im ISMS kennen</p>\r\n</li>\r\n</ol>', '', ''),
(12, 'incidents', 'Sicherheitsvorfälle', '<h1>Vorfallmanagement</h1>\n<h2 style=\"\"><span>Beschreibung</span></h2>\n<p class=\"MsoNormal\" style=\"\"><span style=\"\">Das Incident-Modul ist das operative Instrument zur Bewältigung von Informationssicherheitsvorfällen und bildet den Vorfallmanagement-Prozess gemäß ISO/IEC 27001:2022 Anhang A, Maßnahmen 5.24–5.28 vollständig ab. Ein strukturiertes Vorfallmanagement ist aus mehreren Gründen unerlässlich: Es minimiert Schäden durch schnelle, koordinierte Reaktion, schafft einen dokumentierten Nachweispfad für Regulatoren und Aufsichtsbehörden und liefert wertvolle Erkenntnisse für die kontinuierliche Verbesserung des ISMS.<span style=\"\">  </span>Besonders kritisch sind die gesetzlichen Meldepflichten: Die DSGVO verpflichtet in Art. 33 zur Meldung von Datenpannenvorfällen an die Aufsichtsbehörde innerhalb von 72 Stunden. NIS-2 sieht sogar eine Erstmeldung innerhalb von 24 Stunden und einen Abschlussbericht nach 30 Tagen vor. Der Cyber Resilience Act (CRA) schreibt für Hersteller vernetzter Produkte ähnliche Meldepflichten vor. WolfISMS erkennt automatisch, welche dieser Meldepflichten für einen erfassten Vorfall relevant sind, und kennzeichnet ihn entsprechend.<span style=\"\">  </span>Neben der Meldepflichtprüfung bietet das Modul eine vollständige Vorfallhistorie, Ursachenanalyse-Felder und die direkte Verknüpfung mit Gegenmaßnahmen, um den gesamten Lifecycle eines Vorfalls – von der Erkennung bis zur abschließenden Bewertung – lückenlos zu dokumentieren.</span></p>\n<h2 style=\"\"><span>Funktionen</span></h2>\n<ul>\n<li><strong><span style=\"\">Kategorie-Kacheln: </span></strong><span style=\"\">Übersicht der Vorfälle nach Kategorie (IT-Sicherheit, Datenschutz, Betrieb etc.)</span></li>\n<li><strong><span style=\"\">Meldepflicht-Badges: </span></strong><span style=\"\">Beim Anlegen eines Vorfalls prüft WolfISMS anhand von Typ, Kategorie und Priorität automatisch, welche regulatorischen Meldepflichten ausgelöst werden könnten. Relevante Vorfälle erhalten farbige Badges (DSGVO / NIS-2 / CRA), die sowohl in der Listenansicht als auch in der Detailansicht dauerhaft sichtbar sind. Diese Funktion verhindert, dass Meldepflichten im operativen Stress übersehen werden, und stellt sicher, dass alle Fristen (72 Stunden DSGVO, 24 Stunden NIS-2) im Blick bleiben.</span></li>\n<li><strong><span style=\"\">Vorfallnummer: </span></strong><span style=\"\">Automatischer Vorschlag im Format INC-YYYY-NNN</span></li>\n<li><strong><span style=\"\">Eskalation: </span></strong><span style=\"\">Eskalationsstelle und Eskalationsdatum erfassbar</span></li>\n<li><strong><span style=\"\">Ursachenanalyse: </span></strong><span style=\"\">Nach Behebung eines Vorfalls ermöglicht das Modul eine strukturierte Nachanalyse (Post-Incident-Review): Felder für die Grundursache (Root Cause), ausgenutzte technische oder organisatorische Schwachstellen sowie konkrete Verbesserungsmaßnahmen, die aus dem Vorfall abgeleitet werden. Diese Nachanalyse ist nicht nur Best Practice, sondern gemäß ISO 27001 A 5.27 (Lernen aus Informationssicherheitsvorfällen) explizit gefordert. Die identifizierten Verbesserungsmaßnahmen können direkt als neue Maßnahmen im Maßnahmenmodul angelegt werden.</span></li>\n<li><strong><span style=\"\">Verknüpfungen (incidents): </span></strong><span style=\"\">Verlinkung mit Maßnahmen, Risiken, Assets und Lieferanten</span></li>\n<li><strong><span style=\"\">Kritische Vorfälle: </span></strong><span style=\"\">Offene Vorfälle mit Priorität \"Kritisch\" werden rot hervorgehoben</span></li>\n<li><strong><span style=\"\">Excel-Export: </span></strong><span style=\"\">Vollständiger Incident-Export als .xlsx</span></li>\n<li><strong><span style=\"\">Charts: </span></strong><span style=\"\">Kreisdiagramme: Status, Kategorie, Typ</span></li>\n</ul>', '', ''),
(13, 'berichte', 'Berichte', '<h1 data-start=\"146\" data-end=\"188\">Berichte im ISMS &ndash; Allgemeine Einf&uuml;hrung</h1>\r\n<h2 data-start=\"190\" data-end=\"234\">Zweck und Bedeutung von Berichten im ISMS</h2>\r\n<p data-start=\"236\" data-end=\"532\">Berichte sind ein zentrales Instrument zur <strong data-start=\"279\" data-end=\"336\">Steuerung, Transparenz und Entscheidungsunterst&uuml;tzung</strong> im Informationssicherheits-Managementsystem (ISMS).<br data-start=\"388\" data-end=\"391\">Sie verdichten Informationen aus verschiedenen ISMS-Bereichen und stellen diese <strong data-start=\"471\" data-end=\"527\">strukturiert, verst&auml;ndlich und zielgruppenorientiert</strong> dar.</p>\r\n<p data-start=\"534\" data-end=\"760\">W&auml;hrend das operative ISMS viele Detailinformationen enth&auml;lt, liefern Berichte einen <strong data-start=\"619\" data-end=\"646\">komprimierten &Uuml;berblick</strong> &uuml;ber den aktuellen Stand der Informationssicherheit und erm&ouml;glichen fundierte Management- und Fachentscheidungen.</p>\r\n<hr data-start=\"762\" data-end=\"765\">\r\n<h2 data-start=\"767\" data-end=\"798\">Was ist ein Bericht im ISMS?</h2>\r\n<p data-start=\"800\" data-end=\"922\">Ein Bericht im ISMS ist eine <strong data-start=\"829\" data-end=\"857\">strukturierte Auswertung</strong> von Informationen, Daten oder Kennzahlen aus dem ISMS, z. B. zu:</p>\r\n<ul data-start=\"924\" data-end=\"1012\">\r\n<li data-start=\"924\" data-end=\"935\">\r\n<p data-start=\"926\" data-end=\"935\">Risiken</p>\r\n</li>\r\n<li data-start=\"936\" data-end=\"949\">\r\n<p data-start=\"938\" data-end=\"949\">Ma&szlig;nahmen</p>\r\n</li>\r\n<li data-start=\"950\" data-end=\"963\">\r\n<p data-start=\"952\" data-end=\"963\">Vorf&auml;llen</p>\r\n</li>\r\n<li data-start=\"964\" data-end=\"974\">\r\n<p data-start=\"966\" data-end=\"974\">Audits</p>\r\n</li>\r\n<li data-start=\"975\" data-end=\"990\">\r\n<p data-start=\"977\" data-end=\"990\">Lieferanten</p>\r\n</li>\r\n<li data-start=\"991\" data-end=\"1012\">\r\n<p data-start=\"993\" data-end=\"1012\">Normanforderungen</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"1014\" data-end=\"1154\">Berichte k&ouml;nnen sowohl <strong data-start=\"1037\" data-end=\"1049\">statisch</strong> (z. B. PDF, Managementbericht) als auch <strong data-start=\"1090\" data-end=\"1103\">dynamisch</strong> (Dashboards, Auswertungen im ISMS-Tool) vorliegen.</p>\r\n<hr data-start=\"1156\" data-end=\"1159\">\r\n<h2 data-start=\"1161\" data-end=\"1194\">Zielgruppen von ISMS-Berichten</h2>\r\n<p data-start=\"1196\" data-end=\"1302\">ISMS-Berichte richten sich an unterschiedliche Zielgruppen mit unterschiedlichen Informationsbed&uuml;rfnissen:</p>\r\n<h3 data-start=\"1304\" data-end=\"1318\">Management</h3>\r\n<ul data-start=\"1319\" data-end=\"1419\">\r\n<li data-start=\"1319\" data-end=\"1359\">\r\n<p data-start=\"1321\" data-end=\"1359\">&Uuml;berblick &uuml;ber den Sicherheitsstatus</p>\r\n</li>\r\n<li data-start=\"1360\" data-end=\"1387\">\r\n<p data-start=\"1362\" data-end=\"1387\">Entscheidungsgrundlagen</p>\r\n</li>\r\n<li data-start=\"1388\" data-end=\"1419\">\r\n<p data-start=\"1390\" data-end=\"1419\">Risiken und Handlungsbedarf</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1421\" data-end=\"1424\">\r\n<h3 data-start=\"1426\" data-end=\"1459\">ISMS / Informationssicherheit</h3>\r\n<ul data-start=\"1460\" data-end=\"1556\">\r\n<li data-start=\"1460\" data-end=\"1483\">\r\n<p data-start=\"1462\" data-end=\"1483\">Operative Steuerung</p>\r\n</li>\r\n<li data-start=\"1484\" data-end=\"1516\">\r\n<p data-start=\"1486\" data-end=\"1516\">Nachverfolgung von Ma&szlig;nahmen</p>\r\n</li>\r\n<li data-start=\"1517\" data-end=\"1556\">\r\n<p data-start=\"1519\" data-end=\"1556\">Vorbereitung von Audits und Reviews</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1558\" data-end=\"1561\">\r\n<h3 data-start=\"1563\" data-end=\"1595\">Fach- und IT-Verantwortliche</h3>\r\n<ul data-start=\"1596\" data-end=\"1687\">\r\n<li data-start=\"1596\" data-end=\"1624\">\r\n<p data-start=\"1598\" data-end=\"1624\">Status eigener Ma&szlig;nahmen</p>\r\n</li>\r\n<li data-start=\"1625\" data-end=\"1662\">\r\n<p data-start=\"1627\" data-end=\"1662\">Risikoeinsch&auml;tzung ihrer Bereiche</p>\r\n</li>\r\n<li data-start=\"1663\" data-end=\"1687\">\r\n<p data-start=\"1665\" data-end=\"1687\">Aufgaben und Fristen</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1689\" data-end=\"1692\">\r\n<h3 data-start=\"1694\" data-end=\"1713\">Externe Stellen</h3>\r\n<ul data-start=\"1714\" data-end=\"1760\">\r\n<li data-start=\"1714\" data-end=\"1727\">\r\n<p data-start=\"1716\" data-end=\"1727\">Auditoren</p>\r\n</li>\r\n<li data-start=\"1728\" data-end=\"1738\">\r\n<p data-start=\"1730\" data-end=\"1738\">Kunden</p>\r\n</li>\r\n<li data-start=\"1739\" data-end=\"1760\">\r\n<p data-start=\"1741\" data-end=\"1760\">Aufsichtsbeh&ouml;rden</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"1762\" data-end=\"1765\">\r\n<h2 data-start=\"1767\" data-end=\"1803\">Typische Arten von ISMS-Berichten</h2>\r\n<p data-start=\"1805\" data-end=\"1863\">Im ISMS kommen unterschiedliche Berichtstypen zum Einsatz:</p>\r\n<h3 data-start=\"1865\" data-end=\"1888\">Management-Berichte</h3>\r\n<p data-start=\"1889\" data-end=\"1937\">Verdichtete Darstellung f&uuml;r Entscheidungstr&auml;ger.</p>\r\n<p data-start=\"1939\" data-end=\"1949\">Beispiele:</p>\r\n<ul data-start=\"1950\" data-end=\"2022\">\r\n<li data-start=\"1950\" data-end=\"1972\">\r\n<p data-start=\"1952\" data-end=\"1972\">ISMS-Statusbericht</p>\r\n</li>\r\n<li data-start=\"1973\" data-end=\"2002\">\r\n<p data-start=\"1975\" data-end=\"2002\">Management-Review-Bericht</p>\r\n</li>\r\n<li data-start=\"2003\" data-end=\"2022\">\r\n<p data-start=\"2005\" data-end=\"2022\">Risiko&uuml;bersicht</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"2024\" data-end=\"2027\">\r\n<h3 data-start=\"2029\" data-end=\"2051\">Operative Berichte</h3>\r\n<p data-start=\"2052\" data-end=\"2100\">Detailberichte zur Steuerung des Tagesgesch&auml;fts.</p>\r\n<p data-start=\"2102\" data-end=\"2112\">Beispiele:</p>\r\n<ul data-start=\"2113\" data-end=\"2175\">\r\n<li data-start=\"2113\" data-end=\"2132\">\r\n<p data-start=\"2115\" data-end=\"2132\">Ma&szlig;nahmenstatus</p>\r\n</li>\r\n<li data-start=\"2133\" data-end=\"2151\">\r\n<p data-start=\"2135\" data-end=\"2151\">Offene Risiken</p>\r\n</li>\r\n<li data-start=\"2152\" data-end=\"2175\">\r\n<p data-start=\"2154\" data-end=\"2175\">&Uuml;berf&auml;llige Termine</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"2177\" data-end=\"2180\">\r\n<h3 data-start=\"2182\" data-end=\"2216\">Audit- und Compliance-Berichte</h3>\r\n<p data-start=\"2217\" data-end=\"2248\">Nachweisberichte f&uuml;r Pr&uuml;fungen.</p>\r\n<p data-start=\"2250\" data-end=\"2260\">Beispiele:</p>\r\n<ul data-start=\"2261\" data-end=\"2334\">\r\n<li data-start=\"2261\" data-end=\"2278\">\r\n<p data-start=\"2263\" data-end=\"2278\">Auditberichte</p>\r\n</li>\r\n<li data-start=\"2279\" data-end=\"2305\">\r\n<p data-start=\"2281\" data-end=\"2305\">Abweichungs&uuml;bersichten</p>\r\n</li>\r\n<li data-start=\"2306\" data-end=\"2334\">\r\n<p data-start=\"2308\" data-end=\"2334\">Normkonformit&auml;tsberichte</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"2336\" data-end=\"2339\">\r\n<h3 data-start=\"2341\" data-end=\"2372\">Vorfalls- und Trendberichte</h3>\r\n<p data-start=\"2373\" data-end=\"2415\">Analyse von Ereignissen und Entwicklungen.</p>\r\n<p data-start=\"2417\" data-end=\"2427\">Beispiele:</p>\r\n<ul data-start=\"2428\" data-end=\"2502\">\r\n<li data-start=\"2428\" data-end=\"2450\">\r\n<p data-start=\"2430\" data-end=\"2450\">Vorfallstatistiken</p>\r\n</li>\r\n<li data-start=\"2451\" data-end=\"2484\">\r\n<p data-start=\"2453\" data-end=\"2484\">Wiederkehrende Schwachstellen</p>\r\n</li>\r\n<li data-start=\"2485\" data-end=\"2502\">\r\n<p data-start=\"2487\" data-end=\"2502\">Trendanalysen</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"2504\" data-end=\"2507\">\r\n<h2 data-start=\"2509\" data-end=\"2537\">Datenquellen f&uuml;r Berichte</h2>\r\n<p data-start=\"2539\" data-end=\"2605\">Berichte greifen auf Daten aus allen ISMS-Bereichen zur&uuml;ck, z. B.:</p>\r\n<ul data-start=\"2607\" data-end=\"2807\">\r\n<li data-start=\"2607\" data-end=\"2640\">\r\n<p data-start=\"2609\" data-end=\"2640\">Risiken und Risikobewertungen</p>\r\n</li>\r\n<li data-start=\"2641\" data-end=\"2680\">\r\n<p data-start=\"2643\" data-end=\"2680\">Ma&szlig;nahmen und Wirksamkeitsnachweise</p>\r\n</li>\r\n<li data-start=\"2681\" data-end=\"2713\">\r\n<p data-start=\"2683\" data-end=\"2713\">Vorf&auml;lle und Lessons Learned</p>\r\n</li>\r\n<li data-start=\"2714\" data-end=\"2756\">\r\n<p data-start=\"2716\" data-end=\"2756\">Normanforderungen und Umsetzungsstatus</p>\r\n</li>\r\n<li data-start=\"2757\" data-end=\"2783\">\r\n<p data-start=\"2759\" data-end=\"2783\">Lieferantenbewertungen</p>\r\n</li>\r\n<li data-start=\"2784\" data-end=\"2807\">\r\n<p data-start=\"2786\" data-end=\"2807\">Termine und Fristen</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"2809\" data-end=\"2881\">Durch diese Vernetzung entstehen <strong data-start=\"2842\" data-end=\"2880\">aussagekr&auml;ftige Gesamtauswertungen</strong>.</p>\r\n<hr data-start=\"2883\" data-end=\"2886\">\r\n<h2 data-start=\"2888\" data-end=\"2930\">Qualit&auml;t und Aussagekraft von Berichten</h2>\r\n<p data-start=\"2932\" data-end=\"2979\">Ein guter ISMS-Bericht zeichnet sich aus durch:</p>\r\n<ul data-start=\"2981\" data-end=\"3260\">\r\n<li data-start=\"2981\" data-end=\"3033\">\r\n<p data-start=\"2983\" data-end=\"3033\"><strong data-start=\"2983\" data-end=\"2997\">Aktualit&auml;t</strong> &ndash; Daten sind aktuell und gepflegt</p>\r\n</li>\r\n<li data-start=\"3034\" data-end=\"3087\">\r\n<p data-start=\"3036\" data-end=\"3087\"><strong data-start=\"3036\" data-end=\"3056\">Verst&auml;ndlichkeit</strong> &ndash; klare Struktur und Sprache</p>\r\n</li>\r\n<li data-start=\"3088\" data-end=\"3142\">\r\n<p data-start=\"3090\" data-end=\"3142\"><strong data-start=\"3090\" data-end=\"3102\">Relevanz</strong> &ndash; Fokus auf wesentliche Informationen</p>\r\n</li>\r\n<li data-start=\"3143\" data-end=\"3203\">\r\n<p data-start=\"3145\" data-end=\"3203\"><strong data-start=\"3145\" data-end=\"3168\">Nachvollziehbarkeit</strong> &ndash; Quellen und Annahmen sind klar</p>\r\n</li>\r\n<li data-start=\"3204\" data-end=\"3260\">\r\n<p data-start=\"3206\" data-end=\"3260\"><strong data-start=\"3206\" data-end=\"3233\">Zielgruppenorientierung</strong> &ndash; passend zum Adressaten</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"3262\" data-end=\"3265\">\r\n<h2 data-start=\"3267\" data-end=\"3325\">Berichte im kontinuierlichen Verbesserungsprozess (KVP)</h2>\r\n<p data-start=\"3327\" data-end=\"3386\">Berichte sind ein wesentliches Element des <strong data-start=\"3370\" data-end=\"3385\">PDCA-Zyklus</strong>:</p>\r\n<ul data-start=\"3388\" data-end=\"3567\">\r\n<li data-start=\"3388\" data-end=\"3433\">\r\n<p data-start=\"3390\" data-end=\"3433\"><strong data-start=\"3390\" data-end=\"3399\">Plan:</strong> Planung auf Basis von Berichten</p>\r\n</li>\r\n<li data-start=\"3434\" data-end=\"3469\">\r\n<p data-start=\"3436\" data-end=\"3469\"><strong data-start=\"3436\" data-end=\"3443\">Do:</strong> Umsetzung von Ma&szlig;nahmen</p>\r\n</li>\r\n<li data-start=\"3470\" data-end=\"3525\">\r\n<p data-start=\"3472\" data-end=\"3525\"><strong data-start=\"3472\" data-end=\"3482\">Check:</strong> Bewertung von Kennzahlen und Ergebnissen</p>\r\n</li>\r\n<li data-start=\"3526\" data-end=\"3567\">\r\n<p data-start=\"3528\" data-end=\"3567\"><strong data-start=\"3528\" data-end=\"3536\">Act:</strong> Ableitung von Verbesserungen</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"3569\" data-end=\"3599\">Sie liefern die Grundlage f&uuml;r:</p>\r\n<ul data-start=\"3600\" data-end=\"3686\">\r\n<li data-start=\"3600\" data-end=\"3622\">\r\n<p data-start=\"3602\" data-end=\"3622\">Management-Reviews</p>\r\n</li>\r\n<li data-start=\"3623\" data-end=\"3654\">\r\n<p data-start=\"3625\" data-end=\"3654\">Priorisierung von Ma&szlig;nahmen</p>\r\n</li>\r\n<li data-start=\"3655\" data-end=\"3686\">\r\n<p data-start=\"3657\" data-end=\"3686\">Strategische Entscheidungen</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"3688\" data-end=\"3691\">\r\n<h2 data-start=\"3693\" data-end=\"3726\">Dokumentation und Archivierung</h2>\r\n<p data-start=\"3728\" data-end=\"3763\">ISMS-Berichte m&uuml;ssen je nach Zweck:</p>\r\n<ul data-start=\"3765\" data-end=\"3850\">\r\n<li data-start=\"3765\" data-end=\"3781\">\r\n<p data-start=\"3767\" data-end=\"3781\">versioniert,</p>\r\n</li>\r\n<li data-start=\"3782\" data-end=\"3813\">\r\n<p data-start=\"3784\" data-end=\"3813\">nachvollziehbar archiviert,</p>\r\n</li>\r\n<li data-start=\"3814\" data-end=\"3850\">\r\n<p data-start=\"3816\" data-end=\"3850\">vor unbefugtem Zugriff gesch&uuml;tzt</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"3852\" data-end=\"3953\">werden.<br data-start=\"3859\" data-end=\"3862\">Sie dienen h&auml;ufig als <strong data-start=\"3884\" data-end=\"3910\">langfristige Nachweise</strong> gegen&uuml;ber Auditoren und Aufsichtsbeh&ouml;rden.</p>\r\n<hr data-start=\"3955\" data-end=\"3958\">\r\n<h2 data-start=\"3960\" data-end=\"4001\">Rolle dieses Berichte-Bereichs im ISMS</h2>\r\n<p data-start=\"4003\" data-end=\"4098\">Der Bereich <strong data-start=\"4015\" data-end=\"4029\">&bdquo;Berichte&ldquo;</strong> dient als <strong data-start=\"4040\" data-end=\"4088\">zentrale Auswertungs- und Pr&auml;sentationsebene</strong> des ISMS.</p>\r\n<p data-start=\"4100\" data-end=\"4121\">Er unterst&uuml;tzt dabei:</p>\r\n<ul data-start=\"4122\" data-end=\"4307\">\r\n<li data-start=\"4122\" data-end=\"4172\">\r\n<p data-start=\"4124\" data-end=\"4172\">komplexe Sachverhalte verst&auml;ndlich darzustellen,</p>\r\n</li>\r\n<li data-start=\"4173\" data-end=\"4220\">\r\n<p data-start=\"4175\" data-end=\"4220\">Transparenz &uuml;ber den ISMS-Status zu schaffen,</p>\r\n</li>\r\n<li data-start=\"4221\" data-end=\"4263\">\r\n<p data-start=\"4223\" data-end=\"4263\">fundierte Entscheidungen zu erm&ouml;glichen,</p>\r\n</li>\r\n<li data-start=\"4264\" data-end=\"4307\">\r\n<p data-start=\"4266\" data-end=\"4307\">den Reifegrad des ISMS messbar zu machen.</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"4309\" data-end=\"4417\">Die Hilfeseiten helfen Anwendern, Berichte <strong data-start=\"4352\" data-end=\"4396\">gezielt, aussagekr&auml;ftig und wirkungsvoll</strong> im ISMS einzusetzen.</p>', '', ''),
(14, 'link', 'verknüpfen', '<p>In diesem Bereich können einzelne ISMS-Elemente gezielt miteinander verknüpft werden.<br/>Dadurch lassen sich inhaltliche und organisatorische Zusammenhänge transparent abbilden.</p>\n<p>Beispielsweise kann dokumentiert werden, welche Richtlinien und Dokumente einer bestimmten Norm zugeordnet sind oder welche Assets von einem Sicherheitsvorfall (Incident) betroffen waren.</p>', '', ''),
(15, 'stammd', 'Administration', '<p>Filestruktur:</p>\r\n<p>/var/www/isms</p>\r\n<p>/var/lib/wolfisms</p>\r\n<p>/etc/wolfisms</p>', '', '');

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
('ki_api_key', ''),
('ki_api_version', ''),
('ki_copilot_deployment', ''),
('ki_enabled', ''),
('ki_model', ''),
('ki_prompt_addendum', ''),
('ki_provider', ''),
('pdf_briefpapier_dir', '/var/www/isms/uploads/briefpapier'),
('pdf_briefpapier_margin_bottom', '2.5'),
('pdf_briefpapier_margin_left', '2.5'),
('pdf_briefpapier_margin_right', '2.5'),
('pdf_briefpapier_margin_top', '5'),
('pdf_briefpapier_path', '/var/www/isms/uploads/briefpapier/briefpapier_f253b010.pdf'),
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
  `geaendert` date DEFAULT NULL
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
  `geaendert` date DEFAULT NULL
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
  `geaendert` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `geaendert` date DEFAULT NULL
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
  `prioritaet` varchar(20) DEFAULT NULL COMMENT 'Priorität: niedrig, mittel, hoch, sehr hoch'
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
  `gelöscht` tinyint(1) NOT NULL DEFAULT 0
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
  `massnahmen` varchar(4096) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `geaendert` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `rechtsregister`
--

INSERT INTO `rechtsregister` (`id`, `nummer`, `rechtsgrundlage`, `kuerzel`, `kategorie`, `themenbereich`, `anforderung`, `relevanz`, `bereiche`, `verantwortlicher`, `massnahme`, `dokumentenreferenz`, `status`, `faelligkeit`, `letzte_pruefung`, `anmerkungen`, `ersteller`, `erstellt`, `aenderer`, `geaendert`) VALUES
(1, '1.1', 'Datenschutz-Grundverordnung (EU) 2016/679', 'DSGVO', 'Datenschutz', 'Grundsätze', 'Art. 5: Verarbeitung personenbezogener Daten nach den Grundsätzen Rechtmäßigkeit, Zweckbindung, Datenminimierung, Richtigkeit, Speicherbegrenzung, Integrität & Vertraulichkeit', 'Verarbeitung von Kunden-, Lieferanten- und Mitarbeiterdaten', 'Alle Abteilungen', 'Datenschutzbeauftragter (DSB)', 'Datenschutzrichtlinie, Verzeichnis von Verarbeitungstätigkeiten (VVT)', 'DSB-POL-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(2, '1.2', 'Datenschutz-Grundverordnung (EU) 2016/679', 'DSGVO', 'Datenschutz', 'Verzeichnis der Verarbeitungstätigkeiten', 'Art. 30: Führung eines Verzeichnisses aller Verarbeitungstätigkeiten (VVT) durch Verantwortlichen und Auftragsverarbeiter', 'Pflicht für Unternehmen >250 MA oder bei risikoreicher Verarbeitung', 'IT, HR, Vertrieb, Einkauf', 'DSB', 'VVT erstellen und aktuell halten; mind. jährlich überprüfen', 'DSB-VVT-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(3, '1.3', 'Datenschutz-Grundverordnung (EU) 2016/679', 'DSGVO', 'Datenschutz', 'Betroffenenrechte', 'Art. 12-23: Informationspflicht, Auskunftsrecht, Recht auf Löschung, Widerspruchsrecht, Datenportabilität – Frist 1 Monat', 'Anfragen von Mitarbeitern, Kunden, Bewerbern', 'HR, Vertrieb, IT', 'DSB', 'Prozess für Betroffenenanfragen, Schulung Mitarbeiter', 'DSB-PROC-002', 'Nicht begonnen', '30.06.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(4, '1.4', 'Datenschutz-Grundverordnung (EU) 2016/679', 'DSGVO', 'Datenschutz', 'Datenschutz-Folgenabschätzung', 'Art. 35: DSFA bei voraussichtlich hohem Risiko (z.B. Videoüberwachung, umfangreiche Mitarbeiterüberwachung, neue Technologien)', 'Einsatz von Kamera-/Zugangskontrollsystemen, ERP-Einführung', 'IT, Werksleitung', 'DSB / CISO', 'DSFA-Verfahren definieren, bei Bedarf Aufsichtsbehörde konsultieren', 'DSB-DSFA-001', 'Nicht begonnen', '30.09.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(5, '1.5', 'Datenschutz-Grundverordnung (EU) 2016/679', 'DSGVO', 'Datenschutz', 'Meldepflicht Datenpannen', 'Art. 33-34: Meldung von Datenschutzverletzungen an Aufsichtsbehörde binnen 72 Stunden; ggf. Benachrichtigung Betroffener', 'Jede Datenpanne (Verlust, unbefugter Zugriff, Offenlegung)', 'IT, DSB, Geschäftsführung', 'DSB / CISO', 'Incident-Response-Plan mit DSB-Meldepfad, Kommunikationsvorlage', 'ISM-IRP-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(6, '1.6', 'Datenschutz-Grundverordnung (EU) 2016/679', 'DSGVO', 'Datenschutz', 'Auftragsverarbeitung', 'Art. 28: Abschluss von Auftragsverarbeitungsverträgen (AVV) mit allen Dienstleistern, die personenbezogene Daten verarbeiten', 'Cloud-Dienste, externe IT-Dienstleister, Lohnabrechnung', 'Einkauf, IT, Recht', 'DSB', 'AVV-Vorlage, Dienstleisterliste pflegen', 'DSB-AVV-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(7, '1.7', 'Datenschutz-Grundverordnung (EU) 2016/679', 'DSGVO', 'Datenschutz', 'Datenschutzbeauftragter', 'Art. 37: Benennung eines DSB; Meldung an Aufsichtsbehörde', 'Je nach Unternehmensgröße und Verarbeitungsumfang', 'Geschäftsführung', 'Geschäftsführung', 'DSB benennen/bestellen, Kontaktdaten veröffentlichen', 'DSB-BESTELLUNG-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(8, '2.1', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'ISMS-Kontext', 'Kap. 4: Verstehen der Organisation, interne/externe Themen, interessierte Parteien und Geltungsbereich des ISMS', 'Grundlage für das gesamte ISMS', 'Geschäftsführung, CISO', 'CISO', 'Kontextanalyse, Scoping-Dokument erstellen', 'ISM-KON-001', 'Nicht begonnen', '31.03.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(9, '2.2', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Risikobeurteilung', 'Kap. 6.1 / A 8.2: Informationssicherheits-Risikobeurteilung; Risikobehandlungsplan (RTP)', 'Identifikation aller Informationsrisiken im Unternehmen', 'CISO, IT, Fachabteilungen', 'CISO', 'Risikobewertungsmethodik, Asset-Inventar, Risikoregister', 'ISM-RISK-001', 'Nicht begonnen', '30.06.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(10, '2.3', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'IS-Leitlinie', 'Kap. 5.2 / A 5.1: Informationssicherheitsleitlinie durch Geschäftsführung verabschiedet und kommuniziert', 'Grundsatzdokument für alle IS-Maßnahmen', 'Alle Mitarbeiter', 'CISO / Geschäftsführung', 'IS-Leitlinie erstellen, genehmigen, veröffentlichen', 'ISM-POL-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(11, '2.4', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Asset Management', 'A 5.9-5.12: Inventar aller Informationswerte, Klassifizierung, Kennzeichnung und sicherer Umgang', 'Hardware, Software, Daten, Dienste, Personen', 'IT, Einkauf', 'IT-Leiter', 'Asset-Inventar anlegen und pflegen, Klassifizierungsschema', 'ISM-ASSET-001', 'Nicht begonnen', '31.07.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(12, '2.5', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Zugangs- und Zugriffskontrolle', 'A 5.15-5.18: Need-to-know-Prinzip, Benutzerregistrierung/-abmeldung, privilegierte Zugriffsrechte, Passwortverwaltung', 'Alle IT-Systeme, ERP, CAD-Umgebung', 'IT', 'IT-Leiter / CISO', 'IAM-Richtlinie, RBAC, Review mind. jährlich', 'ISM-IAM-001', 'Nicht begonnen', '31.08.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(13, '2.6', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Kryptographie', 'A 8.24: Richtlinie für kryptographische Maßnahmen (Verschlüsselung, Schlüsselmanagement)', 'Datenübertragung, Datenspeicherung, E-Mail', 'IT', 'IT-Leiter', 'Krypto-Richtlinie, TLS 1.2+, Festplattenverschlüsselung', 'ISM-KRYPTO-001', 'Nicht begonnen', '30.09.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(14, '2.7', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Physische Sicherheit', 'A 7.1-7.14: Physische Zutrittskontrollen, Schutz vor Umweltbedrohungen, sicheres Arbeiten in Sicherheitsbereichen', 'Serverräume, Produktionshalle, Büros', 'Facility Management, IT', 'Werksleiter / IT-Leiter', 'Zutrittskonzept, Schließanlage, CCTV, Clean-Desk-Policy', 'ISM-PHYS-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(15, '2.8', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Betriebssicherheit', 'A 8.1-8.23: Change Management, Schutz vor Malware, Logging, Schwachstellenmanagement, Backups', 'IT-Betrieb, Produktionssysteme (OT/IT-Konvergenz)', 'IT', 'IT-Leiter', 'Change-Management-Prozess, AV-Lösung, SIEM, Backup-Konzept', 'ISM-OPS-001', 'Nicht begonnen', '31.10.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(16, '2.9', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Lieferantenbeziehungen', 'A 5.19-5.22: IS-Anforderungen in Lieferantenverträgen, Überwachung Lieferanten-Leistung', 'IT-Dienstleister, Maschinenzulieferer mit Fernwartungszugang', 'Einkauf, IT', 'CISO / Einkaufsleiter', 'Lieferanten-IS-Fragebogen, Vertragsklauseln, Audit-Rechte', 'ISM-SUPP-001', 'Nicht begonnen', '30.11.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(17, '2.10', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Incident Management', 'A 5.24-5.28: IS-Vorfallmanagement, Vorfallmeldung, Reaktion und Lessons Learned', 'Alle IS-Vorfälle (Cyberangriffe, Datenverlust, Systemausfall)', 'IT, CISO', 'CISO', 'Incident-Response-Plan, Meldeweg, regelmäßige Übungen', 'ISM-IRP-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(18, '2.11', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Business Continuity', 'A 5.29-5.30: IS-Aspekte im BCM, Redundanzen, Wiederherstellungszeiten (RTO/RPO)', 'Kritische Geschäftsprozesse, Produktion, ERP', 'IT, Geschäftsführung', 'CISO / Geschäftsführer', 'BCP/DRP erstellen, RTO/RPO definieren, Tests durchführen', 'ISM-BCP-001', 'Nicht begonnen', '31.03.2026', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(19, '2.12', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Compliance / Rechtsregister', 'A 5.31 / 18.1: Identifizierung gesetzlicher, regulatorischer und vertraglicher Anforderungen; Rechtsregister pflegen', 'Alle Compliance-relevanten Bereiche', 'CISO, DSB, Recht', 'CISO', 'Dieses Rechtsregister, jährliche Überprüfung, Änderungsmanagement', 'ISM-RR-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(20, '2.13', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Internes Audit', 'Kap. 9.2: Regelmäßige interne ISMS-Audits nach geplantem Auditprogramm', 'Gesamtes ISMS', 'CISO, interne Auditoren', 'CISO', 'Auditprogramm erstellen, Auditoren schulen, Berichte dokumentieren', 'ISM-AUDIT-001', 'Nicht begonnen', '30.06.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(21, '2.14', 'ISO/IEC 27001:2022', 'ISO27001', 'Norm', 'Managementbewertung', 'Kap. 9.3: Jährliche Managementbewertung des ISMS durch die Geschäftsführung', 'Gesamtes ISMS', 'Geschäftsführung', 'CISO', 'Management-Review-Protokoll, Kennzahlen, Verbesserungsmaßnahmen', 'ISM-MGR-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(22, '3.1', 'NIS-2-Richtlinie (EU) 2022/2555 / BSIG', 'NIS-2', 'Cybersicherheit', 'Registrierung', 'Art. 27: Registrierungspflicht wesentlicher und wichtiger Einrichtungen beim BSI', 'Maschinenbau i.d.R. Kategorie Wichtige Einrichtung (Verarbeitendes Gewerbe)', 'Geschäftsführung', 'Geschäftsführer / CISO', 'Selbsteinstufung vornehmen, ggf. Registrierung beim BSI', 'ISM-NIS2-001', 'Nicht begonnen', 'Gemäß KRITIS-DachG', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(23, '3.2', 'NIS-2-Richtlinie (EU) 2022/2555 / BSIG', 'NIS-2', 'Cybersicherheit', 'Risikomanagement', 'Art. 21: Geeignete TOM: Sicherheitskonzept, Netzwerksicherheit, Kryptographie, Zugriffskontrolle, Supply-Chain-Sicherheit', 'Gesamte IT-/OT-Infrastruktur, Produktionsnetzwerke', 'IT, OT, CISO', 'CISO', 'NIS-2-konforme Sicherheitsmaßnahmen auf Basis ISO 27001 implementieren', 'ISM-NIS2-002', 'Nicht begonnen', '31.10.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(24, '3.3', 'NIS-2-Richtlinie (EU) 2022/2555 / BSIG', 'NIS-2', 'Cybersicherheit', 'Meldepflicht Sicherheitsvorfälle', 'Art. 23: Erstmeldung 24h, Folgemeldung 72h, Abschlussbericht 1 Monat an BSI', 'Alle erheblichen Cyber-Vorfälle', 'IT, CISO, Geschäftsführung', 'CISO', 'NIS-2-Meldeprozess in IRP integrieren, BSI-Meldeformular bereithalten', 'ISM-IRP-001', 'Nicht begonnen', '31.08.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(25, '3.4', 'NIS-2-Richtlinie (EU) 2022/2555 / BSIG', 'NIS-2', 'Cybersicherheit', 'Lieferkettensicherheit', 'Art. 21 Abs. 2d: Sicherheit in der Lieferkette – Bewertung von Lieferanten und Dienstleistern', 'Zulieferer mit IT-Zugang, Cloud-Dienstleister, Fernwartungsanbieter', 'Einkauf, IT', 'CISO / Einkaufsleiter', 'Lieferanten-Sicherheitsbewertung, Vertragsklauseln, IS-Anforderungen', 'ISM-SUPP-001', 'Nicht begonnen', '30.11.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(26, '3.5', 'NIS-2-Richtlinie (EU) 2022/2555 / BSIG', 'NIS-2', 'Cybersicherheit', 'Schulung Geschäftsleitung', 'Art. 20: Leitungsorgane müssen IS-Schulungen absolvieren; persönliche Haftung bei Pflichtverletzungen', 'Gesamte Geschäftsführung und Führungsebene', 'Geschäftsführung', 'CISO', 'Jährliche IS-Schulung für GF/Management, Teilnahmenachweis', 'ISM-TRAIN-001', 'Nicht begonnen', '30.06.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(27, '3.6', 'NIS-2-Richtlinie (EU) 2022/2555 / BSIG', 'NIS-2', 'Cybersicherheit', 'Netzwerksicherheit', 'Art. 21: Netzwerksicherheit, Sicherheitsmonitoring, Perimeterschutz, Segmentierung IT/OT', 'Produktionsnetzwerk, Büronetzwerk, Fernwartungszugänge', 'IT', 'IT-Leiter / CISO', 'Firewall, IDS/IPS, Netzwerksegmentierung, Monitoring-Konzept', 'ISM-NET-001', 'Nicht begonnen', '30.09.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(28, '3.7', 'NIS-2-Richtlinie (EU) 2022/2555 / BSIG', 'NIS-2', 'Cybersicherheit', 'Multi-Faktor-Authentifizierung', 'Art. 21 Abs. 2j: Einsatz von MFA oder kontinuierlicher Authentifizierung', 'Alle kritischen Systeme, Remote-Zugänge, Admin-Konten', 'IT', 'IT-Leiter', 'MFA für VPN, Admin-Konten, Cloud-Dienste einführen', 'ISM-IAM-001', 'Nicht begonnen', '31.07.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(29, '3.8', 'NIS-2-Richtlinie (EU) 2022/2555 / BSIG', 'NIS-2', 'Cybersicherheit', 'Business Continuity / Krisenmanagement', 'Art. 21 Abs. 2c: Aufrechterhaltung des Betriebs, Backupmanagement, Wiederherstellung, Krisenmanagement', 'Kritische Produktionssysteme, ERP, Kommunikation', 'IT, Produktion', 'CISO / Werksleiter', 'BCP, DRP, Backup-Tests, Krisenplan, Krisenübung', 'ISM-BCP-001', 'Nicht begonnen', '31.03.2026', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(30, '4.1', 'Bundesdatenschutzgesetz (BDSG)', 'BDSG', 'Datenschutz', 'Beschäftigtendatenschutz', 'SS 26, 88 ff. BDSG: Verarbeitung von Beschäftigtendaten nur für Zwecke des Beschäftigungsverhältnisses', 'HR-Prozesse, Zeiterfassung, Videoüberwachung am Arbeitsplatz', 'HR', 'DSB / HR-Leiter', 'Betriebsvereinbarungen prüfen/schließen, Löschkonzept für HR-Daten', 'DSB-HR-001', 'Nicht begonnen', '30.09.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(31, '4.2', 'IT-Sicherheitsgesetz 2.0 / BSIG', 'BSIG', 'Cybersicherheit', 'KRITIS-Pflichten', 'SS 8a ff. BSIG: Betreiber kritischer Infrastrukturen: angemessene Sicherheitsmaßnahmen, Meldepflichten, Nachweise alle 2 Jahre', 'Ggf. relevant wenn Schwellenwerte (500 Mio. EUR Umsatz, systemrelevant) erreicht', 'IT, CISO', 'CISO', 'Schwellenwert-Prüfung, ggf. BSI-Registrierung', 'ISM-NIS2-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(32, '4.3', 'TTDSG', 'TTDSG', 'Datenschutz', 'Cookie-Einwilligung / Website', 'S 25 TTDSG: Einwilligung vor Setzen nicht-essenzieller Cookies; technischer Datenschutz bei Telemedien', 'Unternehmens-Website, Online-Kundenportal', 'Marketing, IT', 'DSB', 'Cookie-Banner, Datenschutzerklärung aktualisieren', 'DSB-WEB-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(33, '4.4', 'Handelsgesetzbuch (HGB) / AO', 'HGB/AO', 'Compliance', 'Aufbewahrungspflichten', 'S 257 HGB, S 147 AO: Geschäftliche Unterlagen 6-10 Jahre aufbewahren; elektronische Archivierung revisionssicher (GoBD)', 'Geschäftsbriefe, Buchhaltung, Verträge, Rechnungen', 'Buchhaltung, IT', 'CFO / IT-Leiter', 'DMS/Archivierungssystem (GoBD-konform), Löschkonzept', 'ISM-ARCH-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(34, '4.5', 'Maschinenverordnung (EU) 2023/1230', 'ProdHaftG/MVO', 'Produktsicherheit', 'Cybersicherheit in Maschinen', 'MVO Art. 10 / Anhang I Kap. 1.1.9: Cybersicherheit als integraler Bestandteil der Maschinensicherheit (ab 20.01.2027)', 'Alle neu entwickelten Maschinen und Steuerungssysteme (SPS, HMI)', 'Entwicklung, Konstruktion', 'Entwicklungsleiter / CISO', 'Security-by-Design in Entwicklungsprozess integrieren, Risikobeurteilung erweitern', 'ISM-DEV-001', 'Nicht begonnen', '20.01.2027', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(35, '4.6', 'Cyber Resilience Act (EU) 2024/2847', 'CRA', 'Produktsicherheit', 'Cybersicherheitsanforderungen Produkte', 'CRA: Hersteller von Produkten mit digitalen Elementen müssen Cybersicherheitsanforderungen über den Lebenszyklus erfüllen; SBOM; CE', 'Vernetzte Maschinen, Steuerungen, IoT-Komponenten', 'Entwicklung, Konstruktion, Vertrieb', 'Entwicklungsleiter / CISO', 'CRA-Produktanalyse, SBOM erstellen, Update-Prozess definieren', 'ISM-DEV-002', 'Nicht begonnen', '11.12.2027', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(36, '5.1', 'EASA Part 21 – Zulassung (Verordnung (EU) Nr. 748/2012)', 'Part 21', 'Luftfahrt / Regulatorisch', 'Design & Produktion', 'Part 21 Subpart G (POA): Produktionsgenehmigung; Qualitätssicherungssystem, Konformitätsnachweise, EASA Form 1 / FAA 8130-3', 'Alle gefertigten Luftfahrtkomponenten und -baugruppen', 'Produktion, Qualität, Entwicklung', 'Qualitätsmanager / Accountable Manager', 'POA-Handbuch (POE), QM-System nach Part 21G, interne Audits, EASA-Überwachung', 'QM-POA-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(37, '5.2', 'EASA Part 145 – Instandhaltungsbetriebe (Verordnung (EU) Nr. 1321/2014)', 'Part 145', 'Luftfahrt / Regulatorisch', 'Instandhaltung', 'Part 145: Genehmigung für Instandhaltung/Reparatur an Luftfahrtteilen; MOE, Certifying Staff, Quality System', 'Nur relevant falls Instandhaltungsleistungen erbracht werden', 'Produktion, Qualität', 'Accountable Manager / QM', 'Prüfen ob Part-145-Tätigkeit vorliegt; ggf. Genehmigung beantragen', 'QM-M145-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(38, '5.3', 'AS9100 Rev. D – QMS Luft- und Raumfahrt', 'AS9100D', 'Luftfahrt / Norm', 'Qualitätsmanagement', 'AS9100D: QMS für Luft- und Raumfahrt; Risikomanagement, Konfigurationsmanagement, FAI (AS9102), FOD-Prävention, Lieferantenmanagement', 'Gesamte Wertschöpfungskette Luftfahrtkomponenten', 'Alle Bereiche', 'Qualitätsmanager', 'AS9100-Zertifizierung anstreben/aufrechterhalten; QMS-Handbuch, interne Audits', 'QM-AS9100-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(39, '5.4', 'EASA CS-25 / CS-23 – Zulassungsspezifikationen', 'CS-25/CS-23', 'Luftfahrt / Norm', 'Technische Normen', 'Certification Specifications: Komponenten müssen CS-Anforderungen und AMC genügen; Nachweise durch Analysen, Tests, Berechnungen', 'Alle sicherheitsrelevanten Bauteile (Primary/Secondary Structure, Systeme)', 'Entwicklung, Qualität', 'Chief Engineer / Entwicklungsleiter', 'Compliance-Matrix erstellen, Nachweisdokumentation (DDP), Koordination mit TC-Inhaber', 'QM-CS-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(40, '5.5', 'DO-178C – Software Airborne Systems Certification', 'DO-178C', 'Luftfahrt / Norm', 'Software-Entwicklung', 'DO-178C: Entwicklungsstandard für sicherheitskritische Luftfahrtsoftware; DAL A-E; Pläne, Anforderungen, Design, Code, Test, CM', 'Alle Softwarekomponenten in Luftfahrtprodukten (Steuerung, Embedded)', 'Softwareentwicklung', 'Software-Entwicklungsleiter / DER', 'SW-Entwicklungspläne (PSAC, SDP, SVP), Tool Qualification, Reviews & Audits', 'QM-SW178-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(41, '5.6', 'DO-254 – Design Assurance Airborne Electronic Hardware', 'DO-254', 'Luftfahrt / Norm', 'Hardware-Entwicklung', 'DO-254: Entwicklungsstandard für komplexe elektronische Hardware (FPGA, ASIC, PLDs); DAL; Validierung, Verifikation, CM', 'Elektronische Baugruppen, FPGAs, PLDs in Luftfahrtprodukten', 'Hardwareentwicklung', 'Hardware-Entwicklungsleiter', 'Hardware-Entwicklungspläne (PHAC, HDP, HVP), Hardware-Reviews', 'QM-HW254-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(42, '5.7', 'ARP4754A – Development of Civil Aircraft and Systems', 'ARP4754A', 'Luftfahrt / Norm', 'Systementwicklung', 'ARP4754A: Systementwicklungsprozess; FHA, SSA, FMEA, FTA; Anforderungsmanagement, Verifikation & Validierung', 'Systemintegration Luftfahrtkomponenten', 'Entwicklung, Systems Engineering', 'Systems Engineer / Entwicklungsleiter', 'System Safety Plan, FHA/SSA-Dokumente, FMEA, Anforderungsmanagement-Tool', 'QM-ARP4754-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(43, '5.8', 'Verordnung (EU) 2018/1139 – EASA Basisverordnung', 'EASA-BVO', 'Luftfahrt / Regulatorisch', 'Grundlegende Anforderungen', 'EASA Basisverordnung: Grundlegende Sicherheitsanforderungen; Rechtsrahmen für alle delegierten Verordnungen (Part 21, 145 etc.)', 'Alle Luftfahrtaktivitäten des Unternehmens', 'Geschäftsführung, QM', 'Accountable Manager', 'Einhaltung aller Part-Vorschriften; Accountable Manager benennen', 'QM-EASA-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(44, '5.9', 'ITAR (22 CFR 120-130) / EAR (15 CFR 730-774)', 'ITAR/EAR', 'Luftfahrt / Export-Kontrolle', 'Exportkontrolle', 'ITAR: US-Exportkontrolle Rüstungsgüter (USML); EAR: Dual-Use-Güter (CCL/ECCN); Genehmigungen, TCP, Mitarbeiterschulungen, Re-Export-Verbote', 'Alle Lieferungen von Komponenten in Luftfahrtanwendungen (v.a. USA, NATO)', 'Exportkontrollbeauftragter, Vertrieb, Einkauf', 'Exportkontrollbeauftragter (EKB)', 'Exportkontroll-Klassifizierung aller Produkte (ECCN/USML), TCP, Schulungen, Genehmigungen', 'EKB-ITAR-001', 'Nicht begonnen', '30.09.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(45, '5.10', 'Dual-Use-Verordnung (EU) 2021/821 / AWG / AWV', 'DualUse', 'Luftfahrt / Export-Kontrolle', 'Exportkontrolle', 'EU Dual-Use-VO: Genehmigungspflicht für Export; AWG/AWV: Außenwirtschaftsrecht; BAFA-Genehmigungen; Catch-All-Klausel', 'Alle Exporte von Produkten und Technologie in Drittländer', 'Exportkontrollbeauftragter, Vertrieb', 'EKB', 'Güterklassifizierung, BAFA-Genehmigungen, Endverbleibserklärungen, Schulungen', 'EKB-DUAL-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(46, '5.11', 'EN 9120 – QMS Luft- und Raumfahrt-Händler', 'EN9120', 'Luftfahrt / Norm', 'Lieferkette', 'EN 9120: Anforderungen an Rückverfolgbarkeit, Echtheitsprüfung (Counterfeit Parts, AS6081), Dokumentenmanagement, CoC, EASA Form 1', 'Einkauf und Weiterlieferung von Zukaufteilen für Luftfahrt', 'Einkauf, Lager, QM', 'Qualitätsmanager / Einkaufsleiter', 'Counterfeit-Parts-Prozess (AS6081), Lieferantenqualifizierung, CoC-Prüfung, Rückverfolgbarkeit', 'QM-EN9120-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(47, '5.12', 'NADCAP – National Aerospace and Defense Contractors Accreditation', 'NADCAP', 'Luftfahrt / Akkreditierung', 'Sonderverfahren', 'NADCAP-Akkreditierung für Sonderverfahren (Schweißen, Wärmebehandlung, NDT, Beschichtungen, Composites, Elektronik)', 'Fertigungsverfahren je nach Produktspektrum', 'Produktion, QM', 'Fertigungsleiter / Qualitätsmanager', 'Prüfen welche NADCAP-Kategorien kundenseitig gefordert werden; Akkreditierung beantragen', 'QM-NADCAP-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(48, '5.13', 'Cybersicherheit Luftfahrt – EASA Part-IS / ED-202A / DO-326A', 'EASA-IS / DO-326A', 'Luftfahrt / Cybersicherheit', 'Informationssicherheit Luftfahrt', 'EASA Part-IS: Cybersicherheitspflichten für Organisationen; DO-326A/ED-202A: IS-Risikobeurteilung Flugzeugsysteme; AMC 20-42', 'Vernetzte Luftfahrtkomponenten, Software, Steuerungssysteme', 'IT, Entwicklung, CISO', 'CISO / Entwicklungsleiter', 'IS-Risikobeurteilung für Luftfahrtprodukte, Security-by-Design, Koordination mit ISMS', 'ISM-AV-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(49, '5.14', 'Produkthaftung Luftfahrt – ProdHaftG / Strict Liability', 'ProdHaftG-Luft', 'Luftfahrt / Recht', 'Produkthaftung', 'Verschärfte Produkthaftung; Dokumentationspflichten 30+ Jahre; Rückverfolgbarkeit jeder Komponente (Serial Number, Batch)', 'Alle gelieferten Luftfahrtkomponenten', 'QM, Recht, Geschäftsführung', 'Qualitätsmanager / Recht', 'Lückenlose Dokumentation (Serialisierung, CoC, Prüfprotokolle), 30-Jahre-Archivierung, Produkthaftpflichtversicherung', 'QM-HAFT-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL),
(50, '5.15', 'EASA Part 145 / Air OPS – Betriebliche Anforderungen', 'Air OPS', 'Luftfahrt / Regulatorisch', 'Betriebliche Anforderungen', 'Falls Komponenten für Betreiber (Airlines) geliefert: Air-OPS-Anforderungen können technische Spezifikationen beeinflussen; ETOPS, MEL', 'Bauteile für Airlinekunden (Ersatzteile, LRUs)', 'Entwicklung, Vertrieb', 'Entwicklungsleiter', 'Technische Spezifikationen auf Air-OPS-Konformität prüfen, Kundenvorgaben beachten', 'QM-AIROPS-001', 'Nicht begonnen', '31.12.2025', '2026-03-10', ' ', NULL, '2026-03-10', NULL, NULL);

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
  `dokumente` text DEFAULT NULL COMMENT 'Kommagetrennte IDs verknüpfter Dokumente (aus Tabelle Dokumente)'
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
(6, 'umgesetzt'),
(7, 'in Umsetzung');

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
-- Tabellenstruktur für Tabelle `Stammdaten`
--

CREATE TABLE `Stammdaten` (
  `Nummer` int(11) NOT NULL,
  `Art` text CHARACTER SET utf16 COLLATE utf16_german2_ci NOT NULL,
  `Bezeichnung` text CHARACTER SET utf16 COLLATE utf16_german2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `Stammdaten`
--

INSERT INTO `Stammdaten` (`Nummer`, `Art`, `Bezeichnung`) VALUES
(27, 'Lizenz', '<h1 data-start=\"645\" data-end=\"700\">Lizenzvereinbarung f&uuml;r WolfISMS (Subscription-Modell)</h1>\r\n<h2 data-start=\"702\" data-end=\"718\">1. Pr&auml;ambel</h2>\r\n<p data-start=\"719\" data-end=\"837\">Diese Lizenzvereinbarung regelt die Nutzung der Software <strong data-start=\"776\" data-end=\"788\">WolfISMS</strong> (nachfolgend &bdquo;Software&ldquo;) durch den Lizenznehmer.</p>\r\n<p data-start=\"839\" data-end=\"1024\">WolfISMS ist ein propriet&auml;res Informationssicherheits-Management-System zur Unterst&uuml;tzung von Governance-, Risiko- und Compliance-Prozessen (u. a. ISO/IEC 27001, NIS2, BSI-Grundschutz).</p>\r\n<p data-start=\"1026\" data-end=\"1129\">Die Software ist urheberrechtlich gesch&uuml;tzt und wird <strong data-start=\"1079\" data-end=\"1113\">nicht als Open-Source-Software</strong> bereitgestellt.</p>\r\n<hr data-start=\"1131\" data-end=\"1134\">\r\n<h2 data-start=\"1136\" data-end=\"1155\">2. Lizenzgeber</h2>\r\n<p data-start=\"1156\" data-end=\"1233\"><strong data-start=\"1156\" data-end=\"1188\">IT-Service Wolfgang Schuster</strong><br data-start=\"1188\" data-end=\"1191\">Inhaber: Wolfgang Schuster<br data-start=\"1217\" data-end=\"1220\">Deutschland</p>\r\n<p data-start=\"1235\" data-end=\"1262\">(nachfolgend &bdquo;Lizenzgeber&ldquo;)</p>\r\n<hr data-start=\"1264\" data-end=\"1267\">\r\n<h2 data-start=\"1269\" data-end=\"1295\">3. Vertragsgegenstand</h2>\r\n<p data-start=\"1296\" data-end=\"1588\">Gegenstand dieser Vereinbarung ist die &Uuml;berlassung von Nutzungsrechten an der Software WolfISMS im Rahmen eines <strong data-start=\"1408\" data-end=\"1459\">zeitlich befristeten Abonnements (Subscription)</strong>, einschlie&szlig;lich zugeh&ouml;riger Module, Datenbankstrukturen, Benutzeroberfl&auml;chen sowie der zur Nutzung erforderlichen Dokumentation.</p>\r\n<hr data-start=\"1590\" data-end=\"1593\">\r\n<h2 data-start=\"1595\" data-end=\"1617\">4. Art der Lizenz</h2>\r\n<p data-start=\"1618\" data-end=\"1662\">Der Lizenzgeber r&auml;umt dem Lizenznehmer eine:</p>\r\n<ul data-start=\"1664\" data-end=\"1741\">\r\n<li data-start=\"1664\" data-end=\"1689\">\r\n<p data-start=\"1666\" data-end=\"1689\">nicht ausschlie&szlig;liche</p>\r\n</li>\r\n<li data-start=\"1690\" data-end=\"1712\">\r\n<p data-start=\"1692\" data-end=\"1712\">nicht &uuml;bertragbare</p>\r\n</li>\r\n<li data-start=\"1713\" data-end=\"1741\">\r\n<p data-start=\"1715\" data-end=\"1741\">nicht unterlizenzierbare</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"1743\" data-end=\"1779\">Lizenz zur Nutzung der Software ein.</p>\r\n<p data-start=\"1781\" data-end=\"1920\">Die Lizenz gilt ausschlie&szlig;lich f&uuml;r den <strong data-start=\"1820\" data-end=\"1873\">internen Einsatz im Unternehmen des Lizenznehmers</strong> und nur im Rahmen einer g&uuml;ltigen Subscription.</p>\r\n<hr data-start=\"1922\" data-end=\"1925\">\r\n<h2 data-start=\"1927\" data-end=\"1953\">5. Umfang der Nutzung</h2>\r\n<p data-start=\"1954\" data-end=\"2043\">Sofern nicht ausdr&uuml;cklich schriftlich anders vereinbart, ist der Lizenznehmer berechtigt:</p>\r\n<ul data-start=\"2045\" data-end=\"2307\">\r\n<li data-start=\"2045\" data-end=\"2126\">\r\n<p data-start=\"2047\" data-end=\"2126\">die Software intern zu betreiben (On-Premise oder Hosting nach Vereinbarung),</p>\r\n</li>\r\n<li data-start=\"2127\" data-end=\"2199\">\r\n<p data-start=\"2129\" data-end=\"2199\">die Software f&uuml;r eigene ISMS-, GRC- und Compliance-Zwecke zu nutzen,</p>\r\n</li>\r\n<li data-start=\"2200\" data-end=\"2307\">\r\n<p data-start=\"2202\" data-end=\"2307\">interne Benutzerkonten im Rahmen der gebuchten Lizenzparameter (z. B. Edition, Benutzeranzahl) anzulegen.</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"2309\" data-end=\"2342\">Nicht gestattet ist insbesondere:</p>\r\n<ul data-start=\"2344\" data-end=\"2572\">\r\n<li data-start=\"2344\" data-end=\"2406\">\r\n<p data-start=\"2346\" data-end=\"2406\">die entgeltliche oder unentgeltliche Weitergabe an Dritte,</p>\r\n</li>\r\n<li data-start=\"2407\" data-end=\"2489\">\r\n<p data-start=\"2409\" data-end=\"2489\">der Betrieb als SaaS-, Cloud- oder Mandantenl&ouml;sung f&uuml;r externe Organisationen,</p>\r\n</li>\r\n<li data-start=\"2490\" data-end=\"2572\">\r\n<p data-start=\"2492\" data-end=\"2572\">das Anbieten der Software oder von Teilen davon als Produkt oder Dienstleistung.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"2574\" data-end=\"2577\">\r\n<h2 data-start=\"2579\" data-end=\"2634\">6. Subscription, Verg&uuml;tung und Zahlungsbedingungen</h2>\r\n<p data-start=\"2635\" data-end=\"2736\">Die Nutzung der Software ist kostenpflichtig und erfolgt ausschlie&szlig;lich im Rahmen einer Subscription.</p>\r\n<p data-start=\"2738\" data-end=\"2800\">Art, Umfang, Laufzeit und H&ouml;he der Verg&uuml;tung ergeben sich aus:</p>\r\n<ul data-start=\"2802\" data-end=\"2925\">\r\n<li data-start=\"2802\" data-end=\"2856\">\r\n<p data-start=\"2804\" data-end=\"2856\">einem separaten Lizenz- oder Subscription-Vertrag,</p>\r\n</li>\r\n<li data-start=\"2857\" data-end=\"2879\">\r\n<p data-start=\"2859\" data-end=\"2879\">einem Angebot oder</p>\r\n</li>\r\n<li data-start=\"2880\" data-end=\"2925\">\r\n<p data-start=\"2882\" data-end=\"2925\">einer g&uuml;ltigen Preisliste des Lizenzgebers.</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"2927\" data-end=\"3123\">Die Subscription ist im Voraus f&uuml;r den jeweiligen Abrechnungszeitraum zu bezahlen.<br data-start=\"3009\" data-end=\"3012\">Ohne g&uuml;ltige Subscription und vollst&auml;ndigen Zahlungseingang besteht <strong data-start=\"3080\" data-end=\"3122\">kein Anspruch auf Updates oder Support</strong>.</p>\r\n<hr data-start=\"3125\" data-end=\"3128\">\r\n<h2 data-start=\"3130\" data-end=\"3167\">7. Updates und Weiterentwicklung</h2>\r\n<p data-start=\"3168\" data-end=\"3239\">W&auml;hrend einer aktiven Subscription erh&auml;lt der Lizenznehmer Zugriff auf:</p>\r\n<ul data-start=\"3241\" data-end=\"3389\">\r\n<li data-start=\"3241\" data-end=\"3273\">\r\n<p data-start=\"3243\" data-end=\"3273\">Fehlerbehebungen (Bugfixes),</p>\r\n</li>\r\n<li data-start=\"3274\" data-end=\"3326\">\r\n<p data-start=\"3276\" data-end=\"3326\">kleinere Verbesserungen und Weiterentwicklungen,</p>\r\n</li>\r\n<li data-start=\"3327\" data-end=\"3389\">\r\n<p data-start=\"3329\" data-end=\"3389\">neue Versionen der Software im Rahmen der gebuchten Edition.</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"3391\" data-end=\"3496\">Ein Anspruch auf bestimmte Funktionen, Erweiterungen oder individuelle Weiterentwicklungen besteht nicht.</p>\r\n<p data-start=\"3498\" data-end=\"3576\"><strong data-start=\"3498\" data-end=\"3576\">Nach Beendigung der Subscription werden keine Updates mehr bereitgestellt.</strong></p>\r\n<hr data-start=\"3578\" data-end=\"3581\">\r\n<h2 data-start=\"3583\" data-end=\"3608\">8. Supportleistungen</h2>\r\n<p data-start=\"3609\" data-end=\"3697\">Supportleistungen werden <strong data-start=\"3634\" data-end=\"3687\">ausschlie&szlig;lich w&auml;hrend einer aktiven Subscription</strong> erbracht.</p>\r\n<p data-start=\"3699\" data-end=\"3734\">Der Support umfasst ausschlie&szlig;lich:</p>\r\n<ul data-start=\"3736\" data-end=\"3851\">\r\n<li data-start=\"3736\" data-end=\"3785\">\r\n<p data-start=\"3738\" data-end=\"3785\">Unterst&uuml;tzung bei der Bedienung der Software,</p>\r\n</li>\r\n<li data-start=\"3786\" data-end=\"3851\">\r\n<p data-start=\"3788\" data-end=\"3851\">Unterst&uuml;tzung bei der Installation und technischen Einrichtung.</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"3853\" data-end=\"3883\">Der Support umfasst <strong data-start=\"3873\" data-end=\"3882\">nicht</strong>:</p>\r\n<ul data-start=\"3885\" data-end=\"4080\">\r\n<li data-start=\"3885\" data-end=\"3940\">\r\n<p data-start=\"3887\" data-end=\"3940\">Beratung zur Informationssicherheit im Allgemeinen,</p>\r\n</li>\r\n<li data-start=\"3941\" data-end=\"4031\">\r\n<p data-start=\"3943\" data-end=\"4031\">Interpretation oder Umsetzung von Normen (z. B. ISO/IEC 27001, NIS2, BSI-Grundschutz),</p>\r\n</li>\r\n<li data-start=\"4032\" data-end=\"4080\">\r\n<p data-start=\"4034\" data-end=\"4080\">fachliche oder organisatorische ISMS-Beratung.</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"4082\" data-end=\"4174\">Weitergehende Support- oder Beratungsleistungen bed&uuml;rfen einer <strong data-start=\"4145\" data-end=\"4173\">gesonderten Vereinbarung</strong>.</p>\r\n<hr data-start=\"4176\" data-end=\"4179\">\r\n<h2 data-start=\"4181\" data-end=\"4223\">9. Betrieb nach Ende der Subscription</h2>\r\n<p data-start=\"4224\" data-end=\"4393\">Nach Beendigung der Subscription ist der Lizenznehmer berechtigt, die zuletzt bereitgestellte Version der Software <strong data-start=\"4339\" data-end=\"4372\">ohne Updates und ohne Support</strong> weiter zu betreiben.</p>\r\n<p data-start=\"4395\" data-end=\"4421\">Der Weiterbetrieb erfolgt:</p>\r\n<ul data-start=\"4423\" data-end=\"4630\">\r\n<li data-start=\"4423\" data-end=\"4470\">\r\n<p data-start=\"4425\" data-end=\"4470\">auf eigene Verantwortung des Lizenznehmers,</p>\r\n</li>\r\n<li data-start=\"4471\" data-end=\"4555\">\r\n<p data-start=\"4473\" data-end=\"4555\">ohne Anspruch auf Fehlerbehebungen, Sicherheitsupdates oder Weiterentwicklungen,</p>\r\n</li>\r\n<li data-start=\"4556\" data-end=\"4630\">\r\n<p data-start=\"4558\" data-end=\"4630\">ohne jegliche Haftung des Lizenzgebers f&uuml;r daraus resultierende Sch&auml;den.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"4632\" data-end=\"4635\">\r\n<h2 data-start=\"4637\" data-end=\"4671\">10. Urheber- und Schutzrechte</h2>\r\n<p data-start=\"4672\" data-end=\"4717\">Alle Rechte an der Software, insbesondere an:</p>\r\n<ul data-start=\"4719\" data-end=\"4844\">\r\n<li data-start=\"4719\" data-end=\"4748\">\r\n<p data-start=\"4721\" data-end=\"4748\">Quellcode und Objektcode,</p>\r\n</li>\r\n<li data-start=\"4749\" data-end=\"4784\">\r\n<p data-start=\"4751\" data-end=\"4784\">Datenbankdesign und Strukturen,</p>\r\n</li>\r\n<li data-start=\"4785\" data-end=\"4809\">\r\n<p data-start=\"4787\" data-end=\"4809\">Benutzeroberfl&auml;chen,</p>\r\n</li>\r\n<li data-start=\"4810\" data-end=\"4844\">\r\n<p data-start=\"4812\" data-end=\"4844\">Konzepten, Methoden und Logiken,</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"4846\" data-end=\"4889\">verbleiben ausschlie&szlig;lich beim Lizenzgeber.</p>\r\n<p data-start=\"4891\" data-end=\"5006\">Der Lizenznehmer erwirbt kein Eigentum an der Software, sondern lediglich ein Nutzungsrecht im vereinbarten Umfang.</p>\r\n<hr data-start=\"5008\" data-end=\"5011\">\r\n<h2 data-start=\"5013\" data-end=\"5042\">11. Verbotene Handlungen</h2>\r\n<p data-start=\"5043\" data-end=\"5077\">Dem Lizenznehmer ist es untersagt:</p>\r\n<ul data-start=\"5079\" data-end=\"5353\">\r\n<li data-start=\"5079\" data-end=\"5179\">\r\n<p data-start=\"5081\" data-end=\"5179\">die Software zu dekompilieren, zu disassemblieren oder zur&uuml;ckzuentwickeln (Reverse Engineering),</p>\r\n</li>\r\n<li data-start=\"5180\" data-end=\"5245\">\r\n<p data-start=\"5182\" data-end=\"5245\">Quellcode ganz oder teilweise zu ver&auml;ndern oder offenzulegen,</p>\r\n</li>\r\n<li data-start=\"5246\" data-end=\"5303\">\r\n<p data-start=\"5248\" data-end=\"5303\">Lizenz-, Copyright- oder Schutzvermerke zu entfernen,</p>\r\n</li>\r\n<li data-start=\"5304\" data-end=\"5353\">\r\n<p data-start=\"5306\" data-end=\"5353\">Sicherheits- oder Lizenzmechanismen zu umgehen.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"5355\" data-end=\"5358\">\r\n<h2 data-start=\"5360\" data-end=\"5398\">12. Anpassungen und Erweiterungen</h2>\r\n<p data-start=\"5399\" data-end=\"5458\">Individuelle Anpassungen, Erweiterungen oder Integrationen:</p>\r\n<ul data-start=\"5460\" data-end=\"5597\">\r\n<li data-start=\"5460\" data-end=\"5505\">\r\n<p data-start=\"5462\" data-end=\"5505\">bed&uuml;rfen der Zustimmung des Lizenzgebers,</p>\r\n</li>\r\n<li data-start=\"5506\" data-end=\"5543\">\r\n<p data-start=\"5508\" data-end=\"5543\">k&ouml;nnen gesondert verg&uuml;tet werden,</p>\r\n</li>\r\n<li data-start=\"5544\" data-end=\"5597\">\r\n<p data-start=\"5546\" data-end=\"5597\">begr&uuml;nden keine Miturheberschaft des Lizenznehmers.</p>\r\n</li>\r\n</ul>\r\n<p data-start=\"5599\" data-end=\"5697\">Sofern nichts anderes vereinbart ist, verbleiben alle daraus entstehenden Rechte beim Lizenzgeber.</p>\r\n<hr data-start=\"5699\" data-end=\"5702\">\r\n<h2 data-start=\"5704\" data-end=\"5727\">13. Gew&auml;hrleistung</h2>\r\n<p data-start=\"5728\" data-end=\"5834\">Die Software wird in dem Zustand bereitgestellt, der dem aktuellen Entwicklungsstand entspricht (&bdquo;as is&ldquo;).</p>\r\n<p data-start=\"5836\" data-end=\"5900\">Der Lizenzgeber &uuml;bernimmt insbesondere keine Gew&auml;hr daf&uuml;r, dass:</p>\r\n<ul data-start=\"5902\" data-end=\"6072\">\r\n<li data-start=\"5902\" data-end=\"5934\">\r\n<p data-start=\"5904\" data-end=\"5934\">die Software fehlerfrei ist,</p>\r\n</li>\r\n<li data-start=\"5935\" data-end=\"5967\">\r\n<p data-start=\"5937\" data-end=\"5967\">sie jederzeit verf&uuml;gbar ist,</p>\r\n</li>\r\n<li data-start=\"5968\" data-end=\"6072\">\r\n<p data-start=\"5970\" data-end=\"6072\">sie allen individuellen rechtlichen oder organisatorischen Anforderungen des Lizenznehmers entspricht.</p>\r\n</li>\r\n</ul>\r\n<hr data-start=\"6074\" data-end=\"6077\">\r\n<h2 data-start=\"6079\" data-end=\"6095\">14. Haftung</h2>\r\n<p data-start=\"6096\" data-end=\"6187\">Der Lizenzgeber haftet nur f&uuml;r Sch&auml;den, die auf Vorsatz oder grober Fahrl&auml;ssigkeit beruhen.</p>\r\n<p data-start=\"6189\" data-end=\"6338\">Eine Haftung f&uuml;r mittelbare Sch&auml;den, entgangenen Gewinn, Datenverlust oder Betriebsunterbrechungen ist &ndash; soweit gesetzlich zul&auml;ssig &ndash; ausgeschlossen.</p>\r\n<hr data-start=\"6340\" data-end=\"6343\">\r\n<h2 data-start=\"6345\" data-end=\"6369\">15. Vertraulichkeit</h2>\r\n<p data-start=\"6370\" data-end=\"6525\">Der Lizenznehmer verpflichtet sich, alle ihm im Zusammenhang mit der Software bekannt gewordenen nicht-&ouml;ffentlichen Informationen vertraulich zu behandeln.</p>\r\n<hr data-start=\"6527\" data-end=\"6530\">\r\n<h2 data-start=\"6532\" data-end=\"6576\">16. Anwendbares Recht und Gerichtsstand</h2>\r\n<p data-start=\"6577\" data-end=\"6704\">Es gilt das Recht der Bundesrepublik Deutschland.<br data-start=\"6626\" data-end=\"6629\">Gerichtsstand ist &ndash; soweit gesetzlich zul&auml;ssig &ndash; der Sitz des Lizenzgebers.</p>\r\n<hr data-start=\"6706\" data-end=\"6709\">\r\n<h2 data-start=\"6711\" data-end=\"6739\">17. Schlussbestimmungen</h2>\r\n<p data-start=\"6740\" data-end=\"6874\">Sollten einzelne Bestimmungen dieser Vereinbarung unwirksam sein oder werden, bleibt die Wirksamkeit der &uuml;brigen Regelungen unber&uuml;hrt.</p>\r\n<hr data-start=\"6876\" data-end=\"6879\">\r\n<p data-start=\"6881\" data-end=\"6937\">&copy; IT-Service Wolfgang Schuster &ndash; Alle Rechte vorbehalten</p>'),
(28, 'Lizenz en', '<h1>License Agreement for WolfISMS (Subscription Model)</h1>\r\n\r\n<p>© IT-Service Wolfgang Schuster – All rights reserved</p>\r\n\r\n<h2>1. Preamble</h2>\r\n<p>\r\nThis License Agreement governs the use of the software <strong>WolfISMS</strong>\r\n(hereinafter referred to as the “Software”) by the Licensee.\r\n</p>\r\n<p>\r\nWolfISMS is a proprietary Information Security Management System designed to support\r\ngovernance, risk, and compliance processes (including ISO/IEC 27001, NIS2, BSI IT-Grundschutz).\r\n</p>\r\n<p>\r\nThe Software is protected by copyright law and is not provided as open-source software.\r\n</p>\r\n\r\n<h2>2. Licensor</h2>\r\n<p>\r\n<strong>IT-Service Wolfgang Schuster</strong><br>\r\nOwner: Wolfgang Schuster<br>\r\nGermany\r\n</p>\r\n\r\n<h2>3. Subject Matter of the Agreement</h2>\r\n<p>\r\nThe subject of this Agreement is the granting of usage rights to the Software WolfISMS\r\nunder a time-limited subscription model, including associated modules, database structures,\r\nuser interfaces, and documentation required for proper use of the Software.\r\n</p>\r\n\r\n<h2>4. Type of License</h2>\r\n<p>The Licensor grants the Licensee a:</p>\r\n<ul>\r\n  <li>non-exclusive</li>\r\n  <li>non-transferable</li>\r\n  <li>non-sublicensable</li>\r\n</ul>\r\n<p>\r\nlicense to use the Software solely for internal use within the Licensee’s organization\r\nand only for the duration of a valid subscription.\r\n</p>\r\n\r\n<h2>5. Scope of Use</h2>\r\n<p>Unless expressly agreed otherwise in writing, the Licensee is entitled to:</p>\r\n<ul>\r\n  <li>operate the Software internally (on-premise or hosted, subject to agreement),</li>\r\n  <li>use the Software for its own ISMS, GRC, and compliance purposes,</li>\r\n  <li>create internal user accounts within the limits of the licensed parameters\r\n      (e.g., edition, number of users).</li>\r\n</ul>\r\n\r\n<p>The following is not permitted:</p>\r\n<ul>\r\n  <li>distribution or transfer of the Software to third parties, whether for consideration or free of charge,</li>\r\n  <li>operation of the Software as a SaaS, cloud, or multi-tenant solution for external organizations,</li>\r\n  <li>offering the Software or parts thereof as a product or service.</li>\r\n</ul>\r\n\r\n<h2>6. Subscription, Fees, and Payment Terms</h2>\r\n<p>\r\nUse of the Software is subject to a fee and is provided exclusively under a subscription model.\r\n</p>\r\n<p>\r\nThe type, scope, duration, and amount of the subscription fees are defined by:\r\n</p>\r\n<ul>\r\n  <li>a separate license or subscription agreement,</li>\r\n  <li>an offer, or</li>\r\n  <li>a valid price list issued by the Licensor.</li>\r\n</ul>\r\n<p>\r\nThe subscription fees are payable in advance for the respective billing period.\r\nWithout a valid subscription and full payment, there is no entitlement to updates or support.\r\n</p>\r\n\r\n<h2>7. Updates and Further Development</h2>\r\n<p>During an active subscription, the Licensee is entitled to receive:</p>\r\n<ul>\r\n  <li>bug fixes,</li>\r\n  <li>minor improvements and enhancements,</li>\r\n  <li>new versions of the Software within the scope of the licensed edition.</li>\r\n</ul>\r\n<p>\r\nThere is no entitlement to specific features or developments.\r\nAfter termination of the subscription, no further updates will be provided.\r\n</p>\r\n\r\n<h2>8. Support Services</h2>\r\n<p>\r\nSupport services are provided only during an active subscription period.\r\n</p>\r\n<p>Support is limited to:</p>\r\n<ul>\r\n  <li>assistance with operating the Software,</li>\r\n  <li>assistance with installation and technical setup of the Software.</li>\r\n</ul>\r\n\r\n<p>Support does not include:</p>\r\n<ul>\r\n  <li>general information security consulting,</li>\r\n  <li>interpretation or implementation of standards (e.g., ISO/IEC 27001, NIS2, BSI IT-Grundschutz),</li>\r\n  <li>organizational or conceptual ISMS consulting.</li>\r\n</ul>\r\n\r\n<p>\r\nAny additional support or consulting services require a separate written agreement.\r\n</p>\r\n\r\n<h2>9. Operation After Expiration of the Subscription</h2>\r\n<p>\r\nAfter termination or expiration of the subscription, the Licensee may continue operating\r\nthe last provided version of the Software without updates and without support.\r\n</p>\r\n<p>The continued operation is carried out:</p>\r\n<ul>\r\n  <li>at the Licensee’s own risk,</li>\r\n  <li>without entitlement to bug fixes, security updates, or further development,</li>\r\n  <li>without liability of the Licensor for damages resulting from such continued use.</li>\r\n</ul>\r\n\r\n<h2>10. Copyright and Intellectual Property Rights</h2>\r\n<p>All rights to the Software, in particular to:</p>\r\n<ul>\r\n  <li>source code and object code,</li>\r\n  <li>database design and structures,</li>\r\n  <li>user interfaces,</li>\r\n  <li>concepts, methods, and logical structures,</li>\r\n</ul>\r\n<p>\r\nremain exclusively with the Licensor.\r\nThe Licensee acquires no ownership rights, but only a right of use within the agreed scope.\r\n</p>\r\n\r\n<h2>11. Prohibited Actions</h2>\r\n<ul>\r\n  <li>decompiling, disassembling, or reverse engineering the Software,</li>\r\n  <li>modifying or disclosing source code in whole or in part,</li>\r\n  <li>removing copyright notices, license references, or protective markings,</li>\r\n  <li>circumventing security or licensing mechanisms.</li>\r\n</ul>\r\n\r\n<h2>12. Customizations and Extensions</h2>\r\n<p>Individual customizations, extensions, or integrations:</p>\r\n<ul>\r\n  <li>require the prior consent of the Licensor,</li>\r\n  <li>may be subject to additional fees,</li>\r\n  <li>do not establish any co-authorship or ownership rights for the Licensee.</li>\r\n</ul>\r\n<p>\r\nUnless expressly agreed otherwise, all resulting rights remain with the Licensor.\r\n</p>\r\n\r\n<h2>13. Warranty</h2>\r\n<p>\r\nThe Software is provided “as is”.\r\n</p>\r\n<p>The Licensor does not warrant that:</p>\r\n<ul>\r\n  <li>the Software is error-free,</li>\r\n  <li>the Software is continuously available,</li>\r\n  <li>the Software meets all legal or organizational requirements of the Licensee.</li>\r\n</ul>\r\n\r\n<h2>14. Liability</h2>\r\n<p>\r\nThe Licensor is liable only for damages caused by willful misconduct or gross negligence.\r\n</p>\r\n<p>\r\nLiability for indirect damages, loss of profit, loss of data, or business interruption\r\nis excluded to the extent permitted by law.\r\n</p>\r\n\r\n<h2>15. Confidentiality</h2>\r\n<p>\r\nThe Licensee shall treat all non-public information obtained in connection with the Software\r\nas confidential.\r\n</p>\r\n\r\n<h2>16. Governing Law and Jurisdiction</h2>\r\n<p>\r\nThis Agreement is governed by the laws of the Federal Republic of Germany.\r\nThe place of jurisdiction is the Licensor’s place of business, insofar as legally permissible.\r\n</p>\r\n\r\n<h2>17. Final Provisions</h2>\r\n<p>\r\nIf individual provisions of this Agreement are or become invalid, the validity of the remaining\r\nprovisions shall remain unaffected.\r\n</p>\r\n');

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
  `abteilung` varchar(80) DEFAULT ' ',
  `norm` tinyint(1) NOT NULL DEFAULT 0,
  `pers` tinyint(1) NOT NULL DEFAULT 0,
  `sso_provider` varchar(20) DEFAULT NULL,
  `sso_sub` varchar(255) DEFAULT NULL,
  `aufgabe` varchar(255) DEFAULT NULL,
  `persnr` int(11) DEFAULT NULL,
  `lang` varchar(2) NOT NULL DEFAULT 'de',
  `dok_read` varchar(1024) DEFAULT ' ',
  `dok_date` date DEFAULT NULL,
  `play` tinyint(1) NOT NULL DEFAULT 0,
  `incidents` tinyint(1) DEFAULT 0,
  `bcm` tinyint(4) DEFAULT 0,
  `custom` tinyint(4) DEFAULT 0,
  `rolle` int(11) NOT NULL DEFAULT 0,
  `totp_secret` varchar(64) DEFAULT NULL,
  `totp_active` tinyint(1) NOT NULL DEFAULT 0,
  `kontakte` tinyint(4) DEFAULT 0,
  `aktiv` tinyint(1) NOT NULL DEFAULT 1
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
  `reihenfolge` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `vendor_gewichte`
--

INSERT INTO `vendor_gewichte` (`id`, `bereich`, `parameter`, `bezeichnung`, `wert_ja`, `wert_teilweise`, `wert_nein`, `reihenfolge`) VALUES
(1, 'vendor_eintritt', 'zert', 'Zertifizierung vorhanden? (ISO 27001, SOC2 etc.)', 0, 2, 5, 1),
(2, 'vendor_eintritt', 'frage', 'Sicherheitsfragebogen ausgefüllt?', 0, 2, 5, 2),
(3, 'vendor_eintritt', 'vertrag', 'Vertragliche Regelung / AVV vorhanden?', 0, 2, 5, 3),
(4, 'vendor_eintritt', 'frueher', 'Früherer Sicherheitsvorfall beim Lieferanten?', 0, 2, 5, 4),
(5, 'vendor_schaden', 'pers', 'Verarbeitung personenbezogener Daten (DSGVO)?', 5, 2, 0, 1),
(6, 'vendor_schaden', 'schutz', 'Hoher Schutzbedarf der Systeme / Daten?', 5, 2, 0, 2),
(7, 'vendor_schaden', 'tier', 'Tier-Kritikalität (1=unkritisch, 3=kritisch)', 5, 4, 2, 3),
(8, 'vendor_schaden', 'recht', 'Rechtliche / Compliance-Anforderungen verletzt?', 5, 2, 0, 4);

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

--
-- Indizes der exportierten Tabellen
--

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
-- Indizes für die Tabelle `smtp_settings`
--
ALTER TABLE `smtp_settings`
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
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `Assets`
--
ALTER TABLE `Assets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT für Tabelle `Dokumente`
--
ALTER TABLE `Dokumente`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `dok_anhaenge`
--
ALTER TABLE `dok_anhaenge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `dok_historie`
--
ALTER TABLE `dok_historie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `mass_anhaenge`
--
ALTER TABLE `mass_anhaenge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `Normen`
--
ALTER TABLE `Normen`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1713;

--
-- AUTO_INCREMENT für Tabelle `norm_status`
--
ALTER TABLE `norm_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `rechtsregister`
--
ALTER TABLE `rechtsregister`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT für Tabelle `Risiko`
--
ALTER TABLE `Risiko`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Risiko_historie`
--
ALTER TABLE `Risiko_historie`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT für Tabelle `smtp_settings`
--
ALTER TABLE `smtp_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `Stammdaten`
--
ALTER TABLE `Stammdaten`
  MODIFY `Nummer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT für Tabelle `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
