<%@ Page Title="Home - Parul University" Language="C#" MasterPageFile="~/Default/BidderMasterWithoutLogin.master" AutoEventWireup="true" CodeFile="BID_BidderHome1.aspx.cs" Inherits="BidderPanel_BID_BidderHome1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* ============================================================
           METRONIC-INSPIRED DESIGN SYSTEM
           Primary: #3699FF | Success: #1BC5BD | Warning: #FFA800
           Danger: #F64E60 | Dark: #181C32 | Light: #F3F6F9
        ============================================================ */
        :root {
            --kt-primary:       #3699FF;
            --kt-primary-dark:  #187DE4;
            --kt-primary-light: #E1F0FF;
            --kt-success:       #1BC5BD;
            --kt-success-light: #C9F7F5;
            --kt-warning:       #FFA800;
            --kt-warning-light: #FFF4DE;
            --kt-danger:        #F64E60;
            --kt-danger-light:  #FFE2E5;
            --kt-dark:          #181C32;
            --kt-dark-75:       #3F4254;
            --kt-dark-50:       #7E8299;
            --kt-dark-25:       #B5B5C3;
            --kt-light:         #F3F6F9;
            --kt-white:         #FFFFFF;
            --kt-border:        #EBEDF3;
            --kt-shadow:        0 0 30px 0 rgba(82,63,105,.05);
            --kt-shadow-lg:     0 0 50px 0 rgba(82,63,105,.15);
            --kt-radius:        0.475rem;
            --kt-radius-lg:     0.85rem;
            --kt-font:          'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        html { scroll-behavior: smooth; }

        body {
            font-family: var(--kt-font);
            background: var(--kt-light);
            color: var(--kt-dark-75);
            font-size: 14px;
            line-height: 1.6;
            overflow-x: hidden;
        }

        /* ── SCROLLBAR ── */
        ::-webkit-scrollbar { width: 6px; }
        ::-webkit-scrollbar-track { background: var(--kt-light); }
        ::-webkit-scrollbar-thumb { background: var(--kt-primary); border-radius: 3px; }

        /* ============================================================
           TOP ANNOUNCEMENT BAR
        ============================================================ */
        .kt-topbar {
            background: var(--kt-dark);
            color: rgba(255,255,255,.7);
            font-size: 12px;
            padding: 8px 0;
            text-align: center;
            letter-spacing: .3px;
        }
        .kt-topbar span { color: var(--kt-warning); font-weight: 600; }

        /* ============================================================
           HEADER / NAVBAR
        ============================================================ */
        .kt-header {
            background: var(--kt-white);
            box-shadow: var(--kt-shadow);
            position: sticky;
            top: 0;
            z-index: 1000;
            transition: box-shadow .3s;
        }
        .kt-header.scrolled { box-shadow: var(--kt-shadow-lg); }

        .kt-header-inner {
            max-width: 1280px;
            margin: 0 auto;
            padding: 0 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 70px;
        }

        /* Logo */
        .kt-brand {
            display: flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
        }
        .kt-brand-icon {
            width: 40px; height: 40px;
            background: linear-gradient(135deg, var(--kt-primary), var(--kt-primary-dark));
            border-radius: var(--kt-radius);
            display: flex; align-items: center; justify-content: center;
            color: #fff; font-size: 20px; font-weight: 800;
            box-shadow: 0 4px 12px rgba(54,153,255,.35);
        }
        .kt-brand-text { font-size: 20px; font-weight: 700; color: var(--kt-dark); }
        .kt-brand-text sub { font-size: 10px; font-weight: 500; color: var(--kt-primary); display: block; line-height: 1; letter-spacing: 1px; text-transform: uppercase; }

        /* Nav links */
        .kt-nav { display: flex; align-items: center; gap: 4px; }
        .kt-nav-link {
            padding: 8px 14px;
            border-radius: var(--kt-radius);
            color: var(--kt-dark-75);
            font-weight: 500;
            font-size: 13.5px;
            text-decoration: none;
            transition: all .2s;
            position: relative;
            cursor: pointer;
            background: none; border: none;
        }
        .kt-nav-link:hover, .kt-nav-link.active {
            background: var(--kt-primary-light);
            color: var(--kt-primary);
        }
        .kt-nav-link.active::after {
            content: '';
            position: absolute;
            bottom: -2px; left: 50%;
            transform: translateX(-50%);
            width: 20px; height: 3px;
            background: var(--kt-primary);
            border-radius: 2px;
        }

        /* Auth buttons */
        .kt-header-actions { display: flex; align-items: center; gap: 10px; }

        .kt-btn {
            display: inline-flex; align-items: center; gap: 6px;
            padding: 9px 20px;
            border-radius: var(--kt-radius);
            font-size: 13px; font-weight: 600;
            cursor: pointer; border: none;
            text-decoration: none;
            transition: all .25s;
            letter-spacing: .3px;
        }
        .kt-btn-outline {
            background: transparent;
            border: 1.5px solid var(--kt-border);
            color: var(--kt-dark-75);
        }
        .kt-btn-outline:hover { border-color: var(--kt-primary); color: var(--kt-primary); background: var(--kt-primary-light); }

        .kt-btn-primary {
            background: linear-gradient(135deg, var(--kt-primary), var(--kt-primary-dark));
            color: #fff;
            box-shadow: 0 4px 12px rgba(54,153,255,.3);
        }
        .kt-btn-primary:hover { transform: translateY(-1px); box-shadow: 0 6px 18px rgba(54,153,255,.4); }

        .kt-btn-success {
            background: linear-gradient(135deg, var(--kt-success), #0bb7af);
            color: #fff;
            box-shadow: 0 4px 12px rgba(27,197,189,.3);
        }
        .kt-btn-success:hover { transform: translateY(-1px); box-shadow: 0 6px 18px rgba(27,197,189,.4); }

        /* Hamburger */
        .kt-hamburger { display: none; flex-direction: column; gap: 5px; cursor: pointer; padding: 4px; }
        .kt-hamburger span { display: block; width: 22px; height: 2px; background: var(--kt-dark-75); border-radius: 2px; transition: .3s; }

        /* ============================================================
           HERO / HOME SECTION
        ============================================================ */
        #home {
            background: linear-gradient(135deg, var(--kt-dark) 0%, #1a2035 60%, #1e3a5f 100%);
            position: relative;
            overflow: hidden;
            padding: 90px 24px 80px;
        }

        /* Geometric background shapes */
        #home::before {
            content: '';
            position: absolute; top: -120px; right: -120px;
            width: 500px; height: 500px;
            background: radial-gradient(circle, rgba(54,153,255,.15) 0%, transparent 70%);
            border-radius: 50%;
        }
        #home::after {
            content: '';
            position: absolute; bottom: -80px; left: -80px;
            width: 400px; height: 400px;
            background: radial-gradient(circle, rgba(27,197,189,.12) 0%, transparent 70%);
            border-radius: 50%;
        }

        .kt-hero-grid {
            max-width: 1280px; margin: 0 auto;
            display: grid; grid-template-columns: 1fr 1fr;
            align-items: center; gap: 60px;
            position: relative; z-index: 1;
        }

        .kt-hero-badge {
            display: inline-flex; align-items: center; gap: 8px;
            background: rgba(54,153,255,.15);
            border: 1px solid rgba(54,153,255,.3);
            color: var(--kt-primary);
            padding: 6px 14px;
            border-radius: 50px;
            font-size: 12px; font-weight: 600;
            letter-spacing: .8px; text-transform: uppercase;
            margin-bottom: 20px;
        }
        .kt-hero-badge::before { content: '●'; font-size: 8px; animation: blink 1.5s infinite; }
        @keyframes blink { 0%,100%{opacity:1} 50%{opacity:.3} }

        .kt-hero-title {
            font-size: clamp(32px, 4vw, 52px);
            font-weight: 800;
            color: #fff;
            line-height: 1.15;
            margin-bottom: 20px;
        }
        .kt-hero-title em {
            font-style: normal;
            background: linear-gradient(90deg, var(--kt-primary), var(--kt-success));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .kt-hero-desc {
            color: rgba(255,255,255,.65);
            font-size: 16px;
            line-height: 1.75;
            margin-bottom: 36px;
            max-width: 480px;
        }

        .kt-hero-actions { display: flex; gap: 14px; flex-wrap: wrap; }

        .kt-btn-hero {
            padding: 13px 28px;
            font-size: 14px;
            border-radius: var(--kt-radius);
        }
        .kt-btn-hero-ghost {
            background: rgba(255,255,255,.08);
            border: 1.5px solid rgba(255,255,255,.2);
            color: #fff;
            font-size: 14px; font-weight: 600;
            padding: 13px 28px;
            border-radius: var(--kt-radius);
            cursor: pointer; text-decoration: none;
            display: inline-flex; align-items: center; gap: 8px;
            transition: all .25s;
        }
        .kt-btn-hero-ghost:hover { background: rgba(255,255,255,.15); border-color: rgba(255,255,255,.4); }

        /* Stats row */
        .kt-hero-stats {
            display: flex; gap: 32px; margin-top: 48px;
            padding-top: 32px;
            border-top: 1px solid rgba(255,255,255,.1);
        }
        .kt-stat-item { }
        .kt-stat-num { font-size: 28px; font-weight: 800; color: #fff; }
        .kt-stat-num span { color: var(--kt-primary); }
        .kt-stat-label { font-size: 12px; color: rgba(255,255,255,.5); letter-spacing: .5px; text-transform: uppercase; }

        /* Hero right — floating card mockup */
        .kt-hero-visual {
            display: flex; flex-direction: column; gap: 14px;
            animation: floatUp 1s ease both;
        }
        @keyframes floatUp { from{opacity:0;transform:translateY(30px)} to{opacity:1;transform:translateY(0)} }

        .kt-mock-card {
            background: rgba(255,255,255,.06);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255,255,255,.12);
            border-radius: var(--kt-radius-lg);
            padding: 20px;
        }
        .kt-mock-header {
            display: flex; align-items: center; justify-content: space-between;
            margin-bottom: 14px;
        }
        .kt-mock-title { color: #fff; font-weight: 700; font-size: 14px; }
        .kt-badge {
            padding: 3px 10px; border-radius: 50px;
            font-size: 11px; font-weight: 600; letter-spacing: .4px;
        }
        .kt-badge-success { background: var(--kt-success-light); color: #0bb7af; }
        .kt-badge-warning { background: var(--kt-warning-light); color: #b07d00; }
        .kt-badge-primary { background: var(--kt-primary-light); color: var(--kt-primary-dark); }
        .kt-badge-danger  { background: var(--kt-danger-light);  color: #b5202f; }

        .kt-mock-row {
            display: flex; align-items: center; justify-content: space-between;
            padding: 8px 0;
            border-bottom: 1px solid rgba(255,255,255,.06);
            color: rgba(255,255,255,.7);
            font-size: 12.5px;
        }
        .kt-mock-row:last-child { border-bottom: none; }
        .kt-mock-row strong { color: #fff; }

        .kt-progress-bar { height: 5px; background: rgba(255,255,255,.1); border-radius: 3px; overflow: hidden; margin-top: 10px; }
        .kt-progress-fill { height: 100%; border-radius: 3px; background: linear-gradient(90deg, var(--kt-primary), var(--kt-success)); }

        /* ============================================================
           SECTION COMMON
        ============================================================ */
        .kt-section { padding: 80px 24px; }
        .kt-section-alt { background: var(--kt-white); }

        .kt-container { max-width: 1280px; margin: 0 auto; }

        .kt-section-head { text-align: center; margin-bottom: 52px; }
        .kt-section-subtitle {
            display: inline-block;
            color: var(--kt-primary);
            font-size: 12px; font-weight: 700;
            letter-spacing: 1.5px; text-transform: uppercase;
            margin-bottom: 12px;
        }
        .kt-section-title {
            font-size: clamp(26px, 3vw, 38px);
            font-weight: 800;
            color: var(--kt-dark);
            line-height: 1.25;
            margin-bottom: 14px;
        }
        .kt-section-desc { color: var(--kt-dark-50); max-width: 560px; margin: 0 auto; font-size: 15px; line-height: 1.7; }

        /* ============================================================
           ACTIVE TENDERS SECTION
        ============================================================ */
        #tenders { background: var(--kt-light); }

        /* Filters */
        .kt-filter-bar {
            display: flex; align-items: center; gap: 12px;
            flex-wrap: wrap; margin-bottom: 28px;
        }
        .kt-search-wrap {
            flex: 1; min-width: 240px;
            position: relative;
        }
        .kt-search-wrap input {
            width: 100%;
            padding: 10px 14px 10px 40px;
            border: 1.5px solid var(--kt-border);
            border-radius: var(--kt-radius);
            background: var(--kt-white);
            font-size: 13.5px;
            color: var(--kt-dark-75);
            outline: none; transition: border-color .2s;
        }
        .kt-search-wrap input:focus { border-color: var(--kt-primary); }
        .kt-search-icon {
            position: absolute; left: 12px; top: 50%;
            transform: translateY(-50%);
            color: var(--kt-dark-25); font-size: 15px;
        }

        .kt-select {
            padding: 10px 14px;
            border: 1.5px solid var(--kt-border);
            border-radius: var(--kt-radius);
            background: var(--kt-white);
            font-size: 13px; color: var(--kt-dark-75);
            outline: none; cursor: pointer;
        }
        .kt-select:focus { border-color: var(--kt-primary); }

        /* Tender Cards Grid */
        .kt-tender-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(340px, 1fr));
            gap: 20px;
        }

        .kt-tender-card {
            background: var(--kt-white);
            border-radius: var(--kt-radius-lg);
            box-shadow: var(--kt-shadow);
            border: 1px solid var(--kt-border);
            overflow: hidden;
            transition: all .3s;
            display: flex; flex-direction: column;
        }
        .kt-tender-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--kt-shadow-lg);
            border-color: rgba(54,153,255,.3);
        }

        .kt-tender-top {
            padding: 20px 20px 0;
            display: flex; align-items: flex-start; justify-content: space-between; gap: 10px;
        }

        .kt-tender-cat {
            display: flex; align-items: center; gap: 8px;
            font-size: 11px; font-weight: 700;
            text-transform: uppercase; letter-spacing: .8px;
            color: var(--kt-primary);
        }
        .kt-tender-cat-icon {
            width: 32px; height: 32px;
            background: var(--kt-primary-light);
            border-radius: var(--kt-radius);
            display: flex; align-items: center; justify-content: center;
            font-size: 16px;
        }

        .kt-tender-title {
            padding: 12px 20px 8px;
            font-size: 15px; font-weight: 700;
            color: var(--kt-dark);
            line-height: 1.4;
        }

        .kt-tender-ref {
            padding: 0 20px 14px;
            font-size: 12px; color: var(--kt-dark-50);
            font-family: 'Courier New', monospace;
        }

        .kt-tender-meta {
            padding: 14px 20px;
            border-top: 1px solid var(--kt-border);
            display: grid; grid-template-columns: 1fr 1fr;
            gap: 10px;
        }
        .kt-meta-item { }
        .kt-meta-label { font-size: 11px; color: var(--kt-dark-25); text-transform: uppercase; letter-spacing: .5px; }
        .kt-meta-val { font-size: 13px; font-weight: 600; color: var(--kt-dark-75); margin-top: 2px; }
        .kt-meta-val.danger { color: var(--kt-danger); }
        .kt-meta-val.success { color: var(--kt-success); }

        .kt-tender-footer {
            padding: 14px 20px;
            background: var(--kt-light);
            display: flex; align-items: center; justify-content: space-between;
            margin-top: auto;
        }

        .kt-deadline-bar { width: 100%; }
        .kt-deadline-text { font-size: 11px; color: var(--kt-dark-50); margin-bottom: 5px; display: flex; justify-content: space-between; }
        .kt-deadline-track { height: 4px; background: var(--kt-border); border-radius: 2px; }
        .kt-deadline-fill { height: 100%; border-radius: 2px; }
        .kt-deadline-fill.green  { background: var(--kt-success); }
        .kt-deadline-fill.yellow { background: var(--kt-warning); }
        .kt-deadline-fill.red    { background: var(--kt-danger); }

        .kt-tender-btn {
            padding: 8px 16px; font-size: 12.5px; font-weight: 600;
            border-radius: var(--kt-radius);
            background: var(--kt-primary-light);
            color: var(--kt-primary);
            border: none; cursor: pointer;
            transition: all .2s;
            text-decoration: none; display: inline-block;
            white-space: nowrap;
        }
        .kt-tender-btn:hover { background: var(--kt-primary); color: #fff; }

        /* Pagination */
        .kt-pagination {
            display: flex; justify-content: center; align-items: center;
            gap: 6px; margin-top: 36px;
        }
        .kt-page-btn {
            width: 36px; height: 36px;
            border-radius: var(--kt-radius);
            border: 1.5px solid var(--kt-border);
            background: var(--kt-white);
            color: var(--kt-dark-75);
            font-size: 13px; font-weight: 500;
            cursor: pointer; display: flex; align-items: center; justify-content: center;
            transition: all .2s;
        }
        .kt-page-btn:hover, .kt-page-btn.active { background: var(--kt-primary); border-color: var(--kt-primary); color: #fff; }

        /* ============================================================
           HOW IT WORKS
        ============================================================ */
        .kt-steps-grid {
            display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 24px; position: relative;
        }
        .kt-steps-grid::before {
            content: '';
            position: absolute; top: 40px; left: 10%; right: 10%;
            height: 2px;
            background: linear-gradient(90deg, var(--kt-primary-light), var(--kt-primary), var(--kt-success));
        }

        .kt-step-card {
            text-align: center;
            position: relative; z-index: 1;
            padding: 28px 20px;
        }
        .kt-step-num {
            width: 64px; height: 64px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--kt-primary), var(--kt-primary-dark));
            color: #fff;
            font-size: 22px; font-weight: 800;
            display: flex; align-items: center; justify-content: center;
            margin: 0 auto 18px;
            box-shadow: 0 6px 20px rgba(54,153,255,.35);
        }
        .kt-step-icon { font-size: 22px; }
        .kt-step-title { font-size: 15px; font-weight: 700; color: var(--kt-dark); margin-bottom: 8px; }
        .kt-step-desc { font-size: 13px; color: var(--kt-dark-50); line-height: 1.6; }

        /* ============================================================
           FEATURES / WHY US
        ============================================================ */
        .kt-features-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }
        .kt-feature-card {
            background: var(--kt-white);
            border-radius: var(--kt-radius-lg);
            padding: 28px;
            border: 1px solid var(--kt-border);
            box-shadow: var(--kt-shadow);
            transition: all .3s;
        }
        .kt-feature-card:hover { transform: translateY(-4px); box-shadow: var(--kt-shadow-lg); border-color: rgba(54,153,255,.3); }
        .kt-feature-ico {
            width: 52px; height: 52px;
            border-radius: var(--kt-radius);
            display: flex; align-items: center; justify-content: center;
            font-size: 24px; margin-bottom: 18px;
        }
        .kt-feature-ico.blue   { background: var(--kt-primary-light); }
        .kt-feature-ico.teal   { background: var(--kt-success-light); }
        .kt-feature-ico.orange { background: var(--kt-warning-light); }
        .kt-feature-ico.red    { background: var(--kt-danger-light);  }
        .kt-feature-title { font-size: 15px; font-weight: 700; color: var(--kt-dark); margin-bottom: 8px; }
        .kt-feature-desc  { font-size: 13px; color: var(--kt-dark-50); line-height: 1.65; }

        /* ============================================================
           ABOUT US SECTION
        ============================================================ */
        #about { background: var(--kt-white); }
        .kt-about-grid {
            display: grid; grid-template-columns: 1fr 1fr;
            gap: 64px; align-items: center;
        }

        .kt-about-label {
            display: inline-flex; align-items: center; gap: 8px;
            color: var(--kt-primary);
            font-size: 12px; font-weight: 700;
            text-transform: uppercase; letter-spacing: 1.5px;
            margin-bottom: 14px;
        }
        .kt-about-title {
            font-size: clamp(26px, 3vw, 36px);
            font-weight: 800; color: var(--kt-dark);
            line-height: 1.25; margin-bottom: 18px;
        }
        .kt-about-desc { color: var(--kt-dark-50); line-height: 1.8; font-size: 14.5px; margin-bottom: 16px; }

        .kt-about-checklist { list-style: none; margin-bottom: 28px; }
        .kt-about-checklist li {
            display: flex; align-items: center; gap: 10px;
            font-size: 14px; color: var(--kt-dark-75);
            padding: 6px 0;
        }
        .kt-check {
            width: 22px; height: 22px;
            background: var(--kt-success-light);
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            color: var(--kt-success); font-size: 12px; font-weight: 700;
            flex-shrink: 0;
        }

        /* About visual panel */
        .kt-about-visual {
            background: linear-gradient(135deg, var(--kt-primary) 0%, var(--kt-primary-dark) 100%);
            border-radius: var(--kt-radius-lg);
            padding: 36px;
            color: #fff;
            position: relative; overflow: hidden;
        }
        .kt-about-visual::before {
            content: '';
            position: absolute; top: -60px; right: -60px;
            width: 200px; height: 200px;
            background: rgba(255,255,255,.1);
            border-radius: 50%;
        }

        .kt-metric-block {
            background: rgba(255,255,255,.12);
            border-radius: var(--kt-radius);
            padding: 20px;
            margin-bottom: 14px;
            backdrop-filter: blur(6px);
        }
        .kt-metric-block:last-child { margin-bottom: 0; }
        .kt-metric-val { font-size: 32px; font-weight: 800; }
        .kt-metric-label { font-size: 13px; opacity: .75; margin-top: 4px; }
        .kt-metric-bar { height: 4px; background: rgba(255,255,255,.2); border-radius: 2px; margin-top: 10px; }
        .kt-metric-bar-fill { height: 100%; background: #fff; border-radius: 2px; }

        /* ============================================================
           CONTACT US SECTION
        ============================================================ */
        #contact { background: var(--kt-light); }

        .kt-contact-grid {
            display: grid; grid-template-columns: 1fr 1.4fr;
            gap: 40px; align-items: start;
        }

        /* Contact info cards */
        .kt-contact-info { display: flex; flex-direction: column; gap: 16px; }
        .kt-info-card {
            background: var(--kt-white);
            border-radius: var(--kt-radius-lg);
            padding: 22px;
            box-shadow: var(--kt-shadow);
            border: 1px solid var(--kt-border);
            display: flex; align-items: flex-start; gap: 16px;
        }
        .kt-info-ico {
            width: 48px; height: 48px;
            border-radius: var(--kt-radius);
            display: flex; align-items: center; justify-content: center;
            font-size: 22px; flex-shrink: 0;
        }
        .kt-info-ico.primary { background: var(--kt-primary-light); }
        .kt-info-ico.success { background: var(--kt-success-light); }
        .kt-info-ico.warning { background: var(--kt-warning-light); }
        .kt-info-title { font-weight: 700; color: var(--kt-dark); font-size: 14px; margin-bottom: 4px; }
        .kt-info-text  { color: var(--kt-dark-50); font-size: 13.5px; line-height: 1.5; }

        /* Contact Form */
        .kt-form-card {
            background: var(--kt-white);
            border-radius: var(--kt-radius-lg);
            padding: 36px;
            box-shadow: var(--kt-shadow);
            border: 1px solid var(--kt-border);
        }
        .kt-form-title { font-size: 20px; font-weight: 700; color: var(--kt-dark); margin-bottom: 6px; }
        .kt-form-sub   { color: var(--kt-dark-50); font-size: 13px; margin-bottom: 24px; }

        .kt-form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; }
        .kt-form-group { margin-bottom: 18px; }
        .kt-form-group.full { grid-column: 1/-1; }

        .kt-label { display: block; font-size: 13px; font-weight: 600; color: var(--kt-dark-75); margin-bottom: 6px; }
        .kt-label span { color: var(--kt-danger); }

        .kt-input, .kt-textarea, .kt-form-select {
            width: 100%;
            padding: 11px 14px;
            border: 1.5px solid var(--kt-border);
            border-radius: var(--kt-radius);
            font-size: 13.5px; font-family: var(--kt-font);
            color: var(--kt-dark-75); background: var(--kt-white);
            outline: none; transition: all .2s;
        }
        .kt-input:focus, .kt-textarea:focus, .kt-form-select:focus {
            border-color: var(--kt-primary);
            box-shadow: 0 0 0 3px rgba(54,153,255,.12);
        }
        .kt-textarea { resize: vertical; min-height: 110px; }

        .kt-form-actions { display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 12px; }
        .kt-form-note { font-size: 12px; color: var(--kt-dark-50); }

        /* ============================================================
           LOGIN / REGISTER MODAL
        ============================================================ */
        .kt-overlay {
            display: none;
            position: fixed; inset: 0;
            background: rgba(0,0,0,.55);
            backdrop-filter: blur(4px);
            z-index: 9000;
            align-items: center; justify-content: center;
            animation: fadeIn .2s ease;
        }
        .kt-overlay.open { display: flex; }
        @keyframes fadeIn { from{opacity:0} to{opacity:1} }

        .kt-modal {
            background: var(--kt-white);
            border-radius: var(--kt-radius-lg);
            width: 100%; max-width: 440px;
            box-shadow: 0 20px 60px rgba(0,0,0,.2);
            overflow: hidden;
            animation: slideUp .3s ease;
        }
        @keyframes slideUp { from{opacity:0;transform:translateY(20px)} to{opacity:1;transform:translateY(0)} }

        .kt-modal-header {
            background: linear-gradient(135deg, var(--kt-dark), #1a2035);
            padding: 28px 32px;
            position: relative;
        }
        .kt-modal-close {
            position: absolute; top: 16px; right: 16px;
            width: 30px; height: 30px;
            border-radius: 50%;
            background: rgba(255,255,255,.1);
            border: none; cursor: pointer;
            color: #fff; font-size: 16px;
            display: flex; align-items: center; justify-content: center;
            transition: background .2s;
        }
        .kt-modal-close:hover { background: rgba(255,255,255,.2); }
        .kt-modal-logo { display: flex; align-items: center; gap: 10px; margin-bottom: 14px; }
        .kt-modal-logo-ico { width: 36px; height: 36px; background: linear-gradient(135deg, var(--kt-primary), var(--kt-primary-dark)); border-radius: var(--kt-radius); display: flex; align-items: center; justify-content: center; color: #fff; font-weight: 800; font-size: 16px; }
        .kt-modal-logo-text { color: #fff; font-weight: 700; font-size: 16px; }
        .kt-modal-title { color: #fff; font-size: 22px; font-weight: 800; }
        .kt-modal-sub   { color: rgba(255,255,255,.6); font-size: 13px; margin-top: 4px; }

        .kt-modal-tabs {
            display: flex;
            border-bottom: 2px solid var(--kt-border);
            background: var(--kt-light);
        }
        .kt-modal-tab {
            flex: 1; padding: 14px;
            text-align: center;
            font-size: 13.5px; font-weight: 600;
            color: var(--kt-dark-50);
            cursor: pointer; border: none; background: none;
            transition: all .2s;
            border-bottom: 2px solid transparent;
            margin-bottom: -2px;
        }
        .kt-modal-tab.active { color: var(--kt-primary); border-bottom-color: var(--kt-primary); background: var(--kt-white); }

        .kt-modal-body { padding: 28px 32px; }
        .kt-tab-panel { display: none; }
        .kt-tab-panel.active { display: block; }

        .kt-modal-footer {
            padding: 16px 32px;
            background: var(--kt-light);
            text-align: center;
            font-size: 12.5px; color: var(--kt-dark-50);
            border-top: 1px solid var(--kt-border);
        }
        .kt-modal-footer a { color: var(--kt-primary); text-decoration: none; font-weight: 600; }

        /* ============================================================
           FOOTER
        ============================================================ */
        .kt-footer {
            background: var(--kt-dark);
            color: rgba(255,255,255,.6);
            padding: 60px 24px 0;
        }
        .kt-footer-grid {
            max-width: 1280px; margin: 0 auto;
            display: grid; grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 40px; padding-bottom: 40px;
        }
        .kt-footer-about-text { font-size: 13.5px; line-height: 1.75; color: rgba(255,255,255,.5); margin-top: 14px; }
        .kt-footer-heading { font-size: 13px; font-weight: 700; color: #fff; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 16px; }
        .kt-footer-links { list-style: none; }
        .kt-footer-links li { margin-bottom: 10px; }
        .kt-footer-links a { color: rgba(255,255,255,.5); text-decoration: none; font-size: 13.5px; transition: color .2s; }
        .kt-footer-links a:hover { color: var(--kt-primary); }
        .kt-footer-bottom {
            border-top: 1px solid rgba(255,255,255,.08);
            padding: 20px 0;
            max-width: 1280px; margin: 0 auto;
            display: flex; justify-content: space-between; align-items: center;
            font-size: 12.5px;
        }
        .kt-footer-bottom a { color: rgba(255,255,255,.4); text-decoration: none; }
        .kt-footer-bottom a:hover { color: var(--kt-primary); }

        /* Social icons */
        .kt-social { display: flex; gap: 10px; margin-top: 20px; }
        .kt-social-btn {
            width: 34px; height: 34px;
            border-radius: var(--kt-radius);
            background: rgba(255,255,255,.08);
            display: flex; align-items: center; justify-content: center;
            color: rgba(255,255,255,.6); font-size: 15px; font-weight: 700;
            text-decoration: none; transition: all .2s;
        }
        .kt-social-btn:hover { background: var(--kt-primary); color: #fff; }

        /* ============================================================
           NOTIFICATION TOAST
        ============================================================ */
        .kt-toast {
            position: fixed; bottom: 24px; right: 24px;
            background: var(--kt-dark);
            color: #fff;
            padding: 14px 20px;
            border-radius: var(--kt-radius-lg);
            display: flex; align-items: center; gap: 12px;
            font-size: 13.5px;
            box-shadow: 0 8px 30px rgba(0,0,0,.25);
            transform: translateX(150%);
            transition: transform .4s cubic-bezier(.175,.885,.32,1.275);
            z-index: 9999;
            max-width: 320px;
        }
        .kt-toast.show { transform: translateX(0); }
        .kt-toast-ico { font-size: 22px; }
        .kt-toast-text strong { display: block; }
        .kt-toast-text span { font-size: 12px; opacity: .7; }

        /* ============================================================
           RESPONSIVE
        ============================================================ */
        @media(max-width: 1024px) {
            .kt-features-grid { grid-template-columns: repeat(2, 1fr); }
            .kt-footer-grid { grid-template-columns: 1fr 1fr; }
        }
        @media(max-width: 768px) {
            .kt-nav { display: none; }
            .kt-hamburger { display: flex; }
            .kt-hero-grid { grid-template-columns: 1fr; }
            .kt-hero-visual { display: none; }
            .kt-about-grid { grid-template-columns: 1fr; }
            .kt-contact-grid { grid-template-columns: 1fr; }
            .kt-features-grid { grid-template-columns: 1fr; }
            .kt-footer-grid { grid-template-columns: 1fr; }
            .kt-steps-grid::before { display: none; }
            .kt-form-row { grid-template-columns: 1fr; }
        }

        /* Mobile nav */
        .kt-mobile-nav {
            display: none;
            background: var(--kt-white);
            border-top: 1px solid var(--kt-border);
            padding: 16px;
            flex-direction: column; gap: 4px;
        }
        .kt-mobile-nav.open { display: flex; }
        .kt-mobile-nav .kt-nav-link { text-align: left; padding: 10px 14px; }

        /* Smooth section transition */
        section { scroll-margin-top: 70px; }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphBreadcrumb" runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphPageContent" runat="Server">
    <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="upBID_Home" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            <!-- Hero Section -->
            <!-- ============================================================
     TOP ANNOUNCEMENT BAR
============================================================ -->
<div class="kt-topbar">
    📢 New Tenders Posted Today &mdash; <span>12 Active Tenders</span> Open for Bidding &nbsp;|&nbsp; Bid Submission Deadline Extensions Applied &nbsp;|&nbsp; <a href="#tenders" style="color:var(--kt-primary);text-decoration:none;">View All →</a>
</div>

<!-- ============================================================
     HEADER
============================================================ -->
<header class="kt-header" id="kt-header">
    <div class="kt-header-inner">
        <!-- Brand -->
        <a href="#home" class="kt-brand" onclick="scrollTo('home')">
            <div class="kt-brand-icon">T</div>
            <div class="kt-brand-text">
                TenderPro
                <sub>Management Portal</sub>
            </div>
        </a>

        <!-- Nav -->
        <nav class="kt-nav">
            <button class="kt-nav-link active" onclick="scrollTo('home')" id="nav-home">Home</button>
            <button class="kt-nav-link" onclick="scrollTo('tenders')" id="nav-tenders">Active Tenders</button>
            <button class="kt-nav-link" onclick="scrollTo('about')" id="nav-about">About Us</button>
            <button class="kt-nav-link" onclick="scrollTo('contact')" id="nav-contact">Contact Us</button>
        </nav>

        <!-- Actions -->
        <div class="kt-header-actions">
            <button class="kt-btn kt-btn-outline" onclick="openModal('login')">&#128274; Login</button>
            <button class="kt-btn kt-btn-primary" onclick="openModal('register')">&#43; Register</button>
            <div class="kt-hamburger" onclick="toggleMobileNav()">
                <span></span><span></span><span></span>
            </div>
        </div>
    </div>
    <div class="kt-mobile-nav" id="kt-mobile-nav">
        <button class="kt-nav-link" onclick="scrollTo('home');closeMobileNav()">Home</button>
        <button class="kt-nav-link" onclick="scrollTo('tenders');closeMobileNav()">Active Tenders</button>
        <button class="kt-nav-link" onclick="scrollTo('about');closeMobileNav()">About Us</button>
        <button class="kt-nav-link" onclick="scrollTo('contact');closeMobileNav()">Contact Us</button>
        <button class="kt-btn kt-btn-outline" style="margin-top:10px;" onclick="openModal('login')">Login</button>
        <button class="kt-btn kt-btn-primary" style="margin-top:8px;" onclick="openModal('register')">Register as Bidder</button>
    </div>
</header>

<!-- ============================================================
     HOME / HERO SECTION
============================================================ -->
<section id="home">
    <div class="kt-hero-grid">
        <!-- Left copy -->
        <div>
            <div class="kt-hero-badge">Government Procurement Portal</div>
            <h1 class="kt-hero-title">
                Transparent &amp; Efficient<br />
                <em>Tender Management</em><br />
                System
            </h1>
            <p class="kt-hero-desc">
                A centralised e-procurement platform for government departments
                and public-sector entities. Discover active tenders, submit bids
                electronically, and track award decisions — all in one place.
            </p>
            <div class="kt-hero-actions">
                <button class="kt-btn kt-btn-primary kt-btn-hero" onclick="scrollTo('tenders')">
                    &#128196; View Active Tenders
                </button>
                <a href="#" class="kt-btn-hero-ghost" onclick="openModal('register');return false;">
                    &#128203; Register as Bidder
                </a>
            </div>
            <div class="kt-hero-stats">
                <div class="kt-stat-item">
                    <div class="kt-stat-num">12<span>+</span></div>
                    <div class="kt-stat-label">Active Tenders</div>
                </div>
                <div class="kt-stat-item">
                    <div class="kt-stat-num">340<span>+</span></div>
                    <div class="kt-stat-label">Registered Bidders</div>
                </div>
                <div class="kt-stat-item">
                    <div class="kt-stat-num">₹86<span>Cr</span></div>
                    <div class="kt-stat-label">Total Value Posted</div>
                </div>
                <div class="kt-stat-item">
                    <div class="kt-stat-num">98<span>%</span></div>
                    <div class="kt-stat-label">Uptime SLA</div>
                </div>
            </div>
        </div>

        <!-- Right visual -->
        <div class="kt-hero-visual">
            <div class="kt-mock-card">
                <div class="kt-mock-header">
                    <span class="kt-mock-title">&#128202; Live Tender Dashboard</span>
                    <span class="kt-badge kt-badge-success">LIVE</span>
                </div>
                <div class="kt-mock-row">
                    <span>Supply of Office Furniture</span>
                    <span class="kt-badge kt-badge-warning">Closing Soon</span>
                </div>
                <div class="kt-mock-row">
                    <span>Road Repair — Ward 12</span>
                    <span class="kt-badge kt-badge-success">Open</span>
                </div>
                <div class="kt-mock-row">
                    <span>IT Infrastructure Upgrade</span>
                    <span class="kt-badge kt-badge-primary">Open</span>
                </div>
                <div class="kt-mock-row">
                    <span>Drinking Water Pipeline</span>
                    <span class="kt-badge kt-badge-danger">2 Days Left</span>
                </div>
                <div style="margin-top:14px;">
                    <div style="font-size:11px;color:rgba(255,255,255,.5);margin-bottom:6px;">Portal Activity Today</div>
                    <div class="kt-progress-bar"><div class="kt-progress-fill" style="width:73%"></div></div>
                </div>
            </div>
            <div class="kt-mock-card" style="display:flex;gap:16px;">
                <div style="flex:1;text-align:center;">
                    <div style="font-size:28px;font-weight:800;color:#fff;">8</div>
                    <div style="font-size:11px;color:rgba(255,255,255,.5);">Bids Today</div>
                </div>
                <div style="flex:1;text-align:center;">
                    <div style="font-size:28px;font-weight:800;color:var(--kt-success);">3</div>
                    <div style="font-size:11px;color:rgba(255,255,255,.5);">Awards Pending</div>
                </div>
                <div style="flex:1;text-align:center;">
                    <div style="font-size:28px;font-weight:800;color:var(--kt-warning);">2</div>
                    <div style="font-size:11px;color:rgba(255,255,255,.5);">Closing Today</div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ============================================================
     HOW IT WORKS
============================================================ -->
<section class="kt-section kt-section-alt">
    <div class="kt-container">
        <div class="kt-section-head">
            <div class="kt-section-subtitle">Simple &amp; Fast</div>
            <h2 class="kt-section-title">How the Bidding Process Works</h2>
            <p class="kt-section-desc">Get started in four easy steps — from registration to bid submission.</p>
        </div>
        <div class="kt-steps-grid">
            <div class="kt-step-card">
                <div class="kt-step-num"><span class="kt-step-icon">&#128203;</span></div>
                <div class="kt-step-title">Register as a Bidder</div>
                <div class="kt-step-desc">Create your account, upload company documents, and complete KYC verification online.</div>
            </div>
            <div class="kt-step-card">
                <div class="kt-step-num"><span class="kt-step-icon">&#128269;</span></div>
                <div class="kt-step-title">Browse Active Tenders</div>
                <div class="kt-step-desc">Search and filter tenders by department, category, value, and deadline date.</div>
            </div>
            <div class="kt-step-card">
                <div class="kt-step-num"><span class="kt-step-icon">&#128196;</span></div>
                <div class="kt-step-title">Download &amp; Prepare Bid</div>
                <div class="kt-step-desc">Download tender documents, prepare your technical and financial bid, then upload securely.</div>
            </div>
            <div class="kt-step-card">
                <div class="kt-step-num"><span class="kt-step-icon">&#127942;</span></div>
                <div class="kt-step-title">Bid Evaluation &amp; Award</div>
                <div class="kt-step-desc">Track evaluation status in real time and receive instant notification on bid award results.</div>
            </div>
        </div>
    </div>
</section>

<!-- ============================================================
     ACTIVE TENDERS SECTION
============================================================ -->
<section id="tenders" class="kt-section">
    <div class="kt-container">
        <div class="kt-section-head">
            <div class="kt-section-subtitle">Procurement Opportunities</div>
            <h2 class="kt-section-title">Active Tenders</h2>
            <p class="kt-section-desc">Browse all current tenders. Register &amp; login to download documents and submit your bid.</p>
        </div>

        <!-- Filter bar -->
        <div class="kt-filter-bar">
            <div class="kt-search-wrap">
                <span class="kt-search-icon">&#128269;</span>
                <input type="text" id="tenderSearch" placeholder="Search tender by title, reference, or department..." oninput="filterTenders()" />
            </div>
            <select class="kt-select" id="catFilter" onchange="filterTenders()">
                <option value="">All Categories</option>
                <option value="Works">Works</option>
                <option value="Goods">Goods &amp; Supply</option>
                <option value="Services">Services</option>
                <option value="IT">IT / Technology</option>
            </select>
            <select class="kt-select" id="deptFilter" onchange="filterTenders()">
                <option value="">All Departments</option>
                <option value="PWD">Public Works</option>
                <option value="Health">Health</option>
                <option value="Education">Education</option>
                <option value="IT Dept">IT Department</option>
                <option value="Municipal">Municipal</option>
            </select>
            <button class="kt-btn kt-btn-primary" onclick="clearFilters()">&#8635; Reset</button>
        </div>

        <!-- Tender cards -->
        <div class="kt-tender-grid" id="tenderGrid">
            <!-- Cards generated by JS below -->
        </div>

        <!-- Pagination -->
        <div class="kt-pagination">
            <button class="kt-page-btn" onclick="changePage(-1)">&#8592;</button>
            <button class="kt-page-btn active" id="pg1" onclick="setPage(1)">1</button>
            <button class="kt-page-btn" id="pg2" onclick="setPage(2)">2</button>
            <button class="kt-page-btn" id="pg3" onclick="setPage(3)">3</button>
            <button class="kt-page-btn" onclick="changePage(1)">&#8594;</button>
        </div>
    </div>
</section>

<!-- ============================================================
     FEATURES
============================================================ -->
<section class="kt-section kt-section-alt">
    <div class="kt-container">
        <div class="kt-section-head">
            <div class="kt-section-subtitle">Why Choose Us</div>
            <h2 class="kt-section-title">Built for Transparent Procurement</h2>
            <p class="kt-section-desc">Our platform provides everything bidders and departments need for a seamless e-procurement experience.</p>
        </div>
        <div class="kt-features-grid">
            <div class="kt-feature-card">
                <div class="kt-feature-ico blue">&#128275;</div>
                <div class="kt-feature-title">Secure &amp; Encrypted</div>
                <div class="kt-feature-desc">All bid submissions are 256-bit AES encrypted. Documents are sealed until the official opening date, ensuring complete confidentiality.</div>
            </div>
            <div class="kt-feature-card">
                <div class="kt-feature-ico teal">&#127758;</div>
                <div class="kt-feature-title">Real-Time Tracking</div>
                <div class="kt-feature-desc">Track your bid status, evaluation progress, and award decisions through a live dashboard. Get instant email and SMS alerts.</div>
            </div>
            <div class="kt-feature-card">
                <div class="kt-feature-ico orange">&#128203;</div>
                <div class="kt-feature-title">Digital Documents</div>
                <div class="kt-feature-desc">Download NIT, BOQ, and all tender documents digitally. Upload your bids, EMD receipts, and certificates paperlessly.</div>
            </div>
            <div class="kt-feature-card">
                <div class="kt-feature-ico red">&#127959;</div>
                <div class="kt-feature-title">Multi-Department</div>
                <div class="kt-feature-desc">Single portal covering all government departments — PWD, Health, Education, Municipal, and more — under one unified login.</div>
            </div>
            <div class="kt-feature-card">
                <div class="kt-feature-ico blue">&#128202;</div>
                <div class="kt-feature-title">Analytics &amp; Reports</div>
                <div class="kt-feature-desc">Access bid comparison sheets, L1 reports, historical pricing data, and department-wise procurement analytics dashboards.</div>
            </div>
            <div class="kt-feature-card">
                <div class="kt-feature-ico teal">&#128241;</div>
                <div class="kt-feature-title">Mobile Friendly</div>
                <div class="kt-feature-desc">Fully responsive design lets bidders access tenders, check status, and receive alerts from any device, anywhere, anytime.</div>
            </div>
        </div>
    </div>
</section>

<!-- ============================================================
     ABOUT US SECTION
============================================================ -->
<section id="about" class="kt-section kt-section-alt">
    <div class="kt-container">
        <div class="kt-about-grid">
            <!-- Left content -->
            <div>
                <div class="kt-about-label">&#127970; About TenderPro</div>
                <h2 class="kt-about-title">Modernising Government Procurement Since 2018</h2>
                <p class="kt-about-desc">TenderPro is a digital e-procurement platform developed under the Digital India initiative to bring transparency, efficiency, and accountability to the public procurement process.</p>
                <p class="kt-about-desc">We serve government departments, PSUs, autonomous bodies, and urban local bodies. Our platform has successfully facilitated thousands of tenders across infrastructure, health, education, and IT sectors.</p>
                <ul class="kt-about-checklist">
                    <li><div class="kt-check">&#10003;</div> Compliant with GFR 2017 &amp; Public Procurement Policy</li>
                    <li><div class="kt-check">&#10003;</div> Integrated with GeM Portal and PFMS</li>
                    <li><div class="kt-check">&#10003;</div> Two-Envelope and Reverse Auction support</li>
                    <li><div class="kt-check">&#10003;</div> Multi-language interface (English, Hindi, Gujarati)</li>
                    <li><div class="kt-check">&#10003;</div> ISO 27001 Certified Information Security</li>
                    <li><div class="kt-check">&#10003;</div> 24x7 Helpdesk Support for Bidders</li>
                </ul>
                <button class="kt-btn kt-btn-primary" onclick="scrollTo('contact')">
                    &#9993; Contact Our Team
                </button>
            </div>

            <!-- Right visual -->
            <div class="kt-about-visual">
                <div style="font-weight:700;font-size:18px;margin-bottom:22px;position:relative;z-index:1;">
                    Portal Performance Overview
                </div>
                <div class="kt-metric-block" style="position:relative;z-index:1;">
                    <div class="kt-metric-val">₹ 86.4 Cr</div>
                    <div class="kt-metric-label">Total Tender Value Processed (FY 2024-25)</div>
                    <div class="kt-metric-bar"><div class="kt-metric-bar-fill" style="width:86%"></div></div>
                </div>
                <div class="kt-metric-block" style="position:relative;z-index:1;">
                    <div class="kt-metric-val">1,248</div>
                    <div class="kt-metric-label">Tenders Published Since Launch</div>
                    <div class="kt-metric-bar"><div class="kt-metric-bar-fill" style="width:72%"></div></div>
                </div>
                <div class="kt-metric-block" style="position:relative;z-index:1;">
                    <div class="kt-metric-val">340+</div>
                    <div class="kt-metric-label">Registered &amp; Verified Bidders</div>
                    <div class="kt-metric-bar"><div class="kt-metric-bar-fill" style="width:60%"></div></div>
                </div>
                <div style="display:grid;grid-template-columns:1fr 1fr;gap:12px;margin-top:14px;position:relative;z-index:1;">
                    <div style="background:rgba(255,255,255,.1);border-radius:var(--kt-radius);padding:14px;text-align:center;">
                        <div style="font-size:22px;font-weight:800;">17</div>
                        <div style="font-size:11px;opacity:.7;margin-top:4px;">Departments Onboarded</div>
                    </div>
                    <div style="background:rgba(255,255,255,.1);border-radius:var(--kt-radius);padding:14px;text-align:center;">
                        <div style="font-size:22px;font-weight:800;">98%</div>
                        <div style="font-size:11px;opacity:.7;margin-top:4px;">Uptime SLA Achieved</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ============================================================
     CONTACT US SECTION
============================================================ -->
<section id="contact" class="kt-section">
    <div class="kt-container">
        <div class="kt-section-head">
            <div class="kt-section-subtitle">Get In Touch</div>
            <h2 class="kt-section-title">Contact Us</h2>
            <p class="kt-section-desc">Have a question about a tender or need technical support? Our team is here to help.</p>
        </div>
        <div class="kt-contact-grid">
            <!-- Info -->
            <div class="kt-contact-info">
                <div class="kt-info-card">
                    <div class="kt-info-ico primary">&#128205;</div>
                    <div>
                        <div class="kt-info-title">Office Address</div>
                        <div class="kt-info-text">TenderPro Portal, Block-C, 2nd Floor<br />Civil Secretariat, Sector 10<br />Gandhinagar, Gujarat — 382010</div>
                    </div>
                </div>
                <div class="kt-info-card">
                    <div class="kt-info-ico success">&#128222;</div>
                    <div>
                        <div class="kt-info-title">Helpdesk (Mon–Sat, 9 AM – 6 PM)</div>
                        <div class="kt-info-text">Toll Free: 1800-XXX-XXXX<br />Direct: +91 79 2324 XXXX<br />Fax: +91 79 2325 XXXX</div>
                    </div>
                </div>
                <div class="kt-info-card">
                    <div class="kt-info-ico warning">&#9993;</div>
                    <div>
                        <div class="kt-info-title">Email Support</div>
                        <div class="kt-info-text">General: info@tenderpro.gov.in<br />Technical: support@tenderpro.gov.in<br />Grievance: grievance@tenderpro.gov.in</div>
                    </div>
                </div>
                <div class="kt-info-card" style="background:linear-gradient(135deg,var(--kt-primary),var(--kt-primary-dark));border-color:transparent;">
                    <div style="color:#fff;">
                        <div style="font-weight:700;font-size:14px;margin-bottom:6px;">&#8987; Bid Submission Timings</div>
                        <div style="font-size:13px;opacity:.85;line-height:1.6;">
                            Portal accepts bid submissions<br />
                            <strong>24 hours / 7 days</strong> up until the deadline.<br />
                            Avoid last-minute submissions.
                        </div>
                    </div>
                </div>
            </div>

            <!-- Form -->
            <div class="kt-form-card">
                <div class="kt-form-title">&#128139; Send us a Message</div>
                <div class="kt-form-sub">Fill in the form below and our team will respond within 1–2 working days.</div>
                <div class="kt-form-row">
                    <div class="kt-form-group">
                        <label class="kt-label">First Name <span>*</span></label>
                        <input type="text" class="kt-input" id="cfFirstName" placeholder="Enter first name" />
                    </div>
                    <div class="kt-form-group">
                        <label class="kt-label">Last Name <span>*</span></label>
                        <input type="text" class="kt-input" id="cfLastName" placeholder="Enter last name" />
                    </div>
                    <div class="kt-form-group">
                        <label class="kt-label">Email Address <span>*</span></label>
                        <input type="email" class="kt-input" id="cfEmail" placeholder="your@email.com" />
                    </div>
                    <div class="kt-form-group">
                        <label class="kt-label">Phone Number</label>
                        <input type="tel" class="kt-input" id="cfPhone" placeholder="+91 XXXXX XXXXX" />
                    </div>
                    <div class="kt-form-group full">
                        <label class="kt-label">Query Type <span>*</span></label>
                        <select class="kt-form-select" id="cfType">
                            <option value="">-- Select query type --</option>
                            <option>Tender Information</option>
                            <option>Bid Submission Help</option>
                            <option>Registration / Login Issue</option>
                            <option>Document Download Problem</option>
                            <option>Payment / EMD Refund</option>
                            <option>General Inquiry</option>
                        </select>
                    </div>
                    <div class="kt-form-group full">
                        <label class="kt-label">Your Message <span>*</span></label>
                        <textarea class="kt-textarea" id="cfMessage" placeholder="Describe your query in detail..."></textarea>
                    </div>
                </div>
                <div class="kt-form-actions">
                    <div class="kt-form-note">&#128274; Your data is safe and will not be shared.</div>
                    <button class="kt-btn kt-btn-primary" onclick="submitContact()">
                        &#128232; Send Message
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ============================================================
     FOOTER
============================================================ -->
<footer class="kt-footer">
    <div class="kt-footer-grid">
        <div>
            <div class="kt-brand" style="display:flex;align-items:center;gap:10px;">
                <div class="kt-brand-icon" style="width:36px;height:36px;font-size:16px;">T</div>
                <div class="kt-brand-text" style="color:#fff;">TenderPro</div>
            </div>
            <div class="kt-footer-about-text">
                Government e-Procurement Portal — bringing transparency, speed, and accountability to public procurement. Developed under Digital India initiative.
            </div>
            <div class="kt-social">
                <a class="kt-social-btn" href="#">f</a>
                <a class="kt-social-btn" href="#">in</a>
                <a class="kt-social-btn" href="#">t</a>
                <a class="kt-social-btn" href="#">yt</a>
            </div>
        </div>
        <div>
            <div class="kt-footer-heading">Quick Links</div>
            <ul class="kt-footer-links">
                <li><a href="#" onclick="scrollTo('home');return false;">Home</a></li>
                <li><a href="#" onclick="scrollTo('tenders');return false;">Active Tenders</a></li>
                <li><a href="#" onclick="scrollTo('about');return false;">About Us</a></li>
                <li><a href="#" onclick="scrollTo('contact');return false;">Contact Us</a></li>
                <li><a href="#">Corrigendum</a></li>
            </ul>
        </div>
        <div>
            <div class="kt-footer-heading">Bidder Resources</div>
            <ul class="kt-footer-links">
                <li><a href="#">How to Register</a></li>
                <li><a href="#">Bid Submission Guide</a></li>
                <li><a href="#">EMD &amp; Payment</a></li>
                <li><a href="#">FAQs</a></li>
                <li><a href="#">Helpdesk</a></li>
            </ul>
        </div>
        <div>
            <div class="kt-footer-heading">Legal</div>
            <ul class="kt-footer-links">
                <li><a href="#">Terms of Service</a></li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Disclaimer</a></li>
                <li><a href="#">RTI Disclosures</a></li>
                <li><a href="#">Accessibility</a></li>
            </ul>
        </div>
    </div>
    <div class="kt-footer-bottom">
        <div>&copy; 2025 TenderPro — Government e-Procurement Portal. All rights reserved.</div>
        <div>
            <a href="#">Sitemap</a> &nbsp;|&nbsp;
            <a href="#">Accessibility</a> &nbsp;|&nbsp;
            <a href="#">NIC India</a>
        </div>
    </div>
</footer>

<!-- ============================================================
     LOGIN / REGISTER MODAL
============================================================ -->
<div class="kt-overlay" id="authOverlay" onclick="closeModalOnOverlay(event)">
    <div class="kt-modal" id="authModal">
        <div class="kt-modal-header">
            <button class="kt-modal-close" onclick="closeModal()">&#215;</button>
            <div class="kt-modal-logo">
                <div class="kt-modal-logo-ico">T</div>
                <div class="kt-modal-logo-text">TenderPro Portal</div>
            </div>
            <div class="kt-modal-title">Bidder Access</div>
            <div class="kt-modal-sub">Secure access to your procurement account</div>
        </div>

        <!-- Tabs -->
        <div class="kt-modal-tabs">
            <button class="kt-modal-tab active" id="tabLogin" onclick="switchTab('login')">&#128274; Login</button>
            <button class="kt-modal-tab" id="tabRegister" onclick="switchTab('register')">&#43; New Registration</button>
        </div>

        <div class="kt-modal-body">

            <!-- LOGIN PANEL -->
            <div class="kt-tab-panel active" id="panelLogin">
                <div class="kt-form-group">
                    <label class="kt-label">User ID / Email <span>*</span></label>
                    <input type="text" class="kt-input" placeholder="Enter your User ID or Email" />
                </div>
                <div class="kt-form-group">
                    <label class="kt-label">Password <span>*</span></label>
                    <input type="password" class="kt-input" placeholder="Enter your password" />
                </div>
                <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:18px;font-size:13px;">
                    <label style="display:flex;align-items:center;gap:6px;color:var(--kt-dark-75);cursor:pointer;">
                        <input type="checkbox" /> Remember me
                    </label>
                    <a href="#" style="color:var(--kt-primary);text-decoration:none;font-weight:600;">Forgot Password?</a>
                </div>
                <button class="kt-btn kt-btn-primary" style="width:100%;justify-content:center;padding:12px;" onclick="handleLogin()">
                    &#128274; Secure Login
                </button>
                <div style="margin-top:14px;padding:12px;background:var(--kt-light);border-radius:var(--kt-radius);font-size:12px;color:var(--kt-dark-50);">
                    &#8505; First time? <a href="#" style="color:var(--kt-primary);font-weight:600;" onclick="switchTab('register')">Register as a new bidder</a> to access tender documents and submit bids.
                </div>
            </div>

            <!-- REGISTER PANEL -->
            <div class="kt-tab-panel" id="panelRegister">
                <div style="display:grid;grid-template-columns:1fr 1fr;gap:12px;">
                    <div class="kt-form-group">
                        <label class="kt-label">First Name <span>*</span></label>
                        <input type="text" class="kt-input" placeholder="First name" />
                    </div>
                    <div class="kt-form-group">
                        <label class="kt-label">Last Name <span>*</span></label>
                        <input type="text" class="kt-input" placeholder="Last name" />
                    </div>
                </div>
                <div class="kt-form-group">
                    <label class="kt-label">Company / Organisation Name <span>*</span></label>
                    <input type="text" class="kt-input" placeholder="Enter your company name" />
                </div>
                <div class="kt-form-group">
                    <label class="kt-label">Email Address <span>*</span></label>
                    <input type="email" class="kt-input" placeholder="company@email.com" />
                </div>
                <div class="kt-form-group">
                    <label class="kt-label">Mobile Number <span>*</span></label>
                    <input type="tel" class="kt-input" placeholder="+91 XXXXX XXXXX" />
                </div>
                <div style="display:grid;grid-template-columns:1fr 1fr;gap:12px;">
                    <div class="kt-form-group">
                        <label class="kt-label">Password <span>*</span></label>
                        <input type="password" class="kt-input" placeholder="Create password" />
                    </div>
                    <div class="kt-form-group">
                        <label class="kt-label">Confirm Password <span>*</span></label>
                        <input type="password" class="kt-input" placeholder="Repeat password" />
                    </div>
                </div>
                <div style="margin-bottom:16px;font-size:12.5px;color:var(--kt-dark-50);display:flex;align-items:flex-start;gap:8px;">
                    <input type="checkbox" style="margin-top:2px;" />
                    <span>I agree to the <a href="#" style="color:var(--kt-primary);">Terms &amp; Conditions</a> and <a href="#" style="color:var(--kt-primary);">Privacy Policy</a> of TenderPro Portal.</span>
                </div>
                <button class="kt-btn kt-btn-success" style="width:100%;justify-content:center;padding:12px;" onclick="handleRegister()">
                    &#128203; Create Bidder Account
                </button>
            </div>
        </div>

        <div class="kt-modal-footer">
            &#128274; Your information is protected by 256-bit SSL encryption &nbsp;|&nbsp;
            <a href="#" onclick="closeModal()">Need Help?</a>
        </div>
    </div>
</div>

<!-- ============================================================
     TOAST NOTIFICATION
============================================================ -->
<div class="kt-toast" id="ktToast">
    <div class="kt-toast-ico" id="toastIco">&#10003;</div>
    <div class="kt-toast-text">
        <strong id="toastTitle">Success</strong>
        <span id="toastMsg">Action completed successfully.</span>
    </div>
</div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cphScripts" runat="Server">
  <script>
      /* ── Tender Data ── */
      var tenders = [
          { id: 'TND/PWD/2025/001', title: 'Supply &amp; Installation of Solar Street Lights', cat: 'Goods', dept: 'PWD', value: '₹42,00,000', deadline: '2025-06-15', daysLeft: 18, pct: 35, status: 'Open', icon: '&#9728;' },
          { id: 'TND/HLTH/2025/018', title: 'Renovation of District Hospital OPD Wing', cat: 'Works', dept: 'Health', value: '₹1,20,00,000', deadline: '2025-06-10', daysLeft: 13, pct: 55, status: 'Open', icon: '&#127973;' },
          { id: 'TND/EDU/2025/007', title: 'Supply of Computer Labs — 25 Government Schools', cat: 'IT', dept: 'Education', value: '₹68,50,000', deadline: '2025-06-05', daysLeft: 8, pct: 75, status: 'Closing Soon', icon: '&#128187;' },
          { id: 'TND/MC/2025/033', title: 'Construction of Storm Water Drainage — Ward 7-12', cat: 'Works', dept: 'Municipal', value: '₹2,35,00,000', deadline: '2025-06-03', daysLeft: 6, pct: 80, status: 'Closing Soon', icon: '&#127780;' },
          { id: 'TND/IT/2025/014', title: 'Procurement of Enterprise Firewall &amp; Security Suite', cat: 'IT', dept: 'IT Dept', value: '₹18,00,000', deadline: '2025-06-20', daysLeft: 23, pct: 20, status: 'Open', icon: '&#128272;' },
          { id: 'TND/PWD/2025/009', title: 'Resurfacing of Internal Roads — Sector 14-18', cat: 'Works', dept: 'PWD', value: '₹55,00,000', deadline: '2025-06-01', daysLeft: 4, pct: 90, status: 'Urgent', icon: '&#128739;' },
          { id: 'TND/HLTH/2025/022', title: 'Annual Maintenance of Medical Imaging Equipment', cat: 'Services', dept: 'Health', value: '₹22,50,000', deadline: '2025-06-25', daysLeft: 28, pct: 15, status: 'Open', icon: '&#128736;' },
          { id: 'TND/MC/2025/041', title: 'Supply of Office Furniture — Municipal Corporation HQ', cat: 'Goods', dept: 'Municipal', value: '₹9,80,000', deadline: '2025-06-08', daysLeft: 11, pct: 60, status: 'Open', icon: '&#127968;' },
          { id: 'TND/IT/2025/019', title: 'Development of GIS-Based Asset Tracking Module', cat: 'IT', dept: 'IT Dept', value: '₹35,00,000', deadline: '2025-07-02', daysLeft: 35, pct: 10, status: 'Open', icon: '&#127760;' },
      ];

      var currentPage = 1, itemsPerPage = 6;
      var filtered = tenders.slice();

      function renderTenders() {
          var grid = document.getElementById('tenderGrid');
          var start = (currentPage - 1) * itemsPerPage, end = start + itemsPerPage;
          var page = filtered.slice(start, end);

          if (!page.length) {
              grid.innerHTML = '<div style="grid-column:1/-1;text-align:center;padding:60px;color:var(--kt-dark-50);"><div style="font-size:48px;margin-bottom:12px;">&#128269;</div><strong>No tenders found.</strong><br/>Try adjusting your search or filters.</div>';
              return;
          }

          grid.innerHTML = page.map(function (t) {
              var barClass = t.pct >= 80 ? 'red' : t.pct >= 55 ? 'yellow' : 'green';
              var badgeClass = t.status === 'Urgent' || t.status === 'Closing Soon' ? 'kt-badge-danger' : 'kt-badge-success';
              return '<div class="kt-tender-card">'
                  + '<div class="kt-tender-top"><div class="kt-tender-cat"><div class="kt-tender-cat-icon">' + t.icon + '</div>' + t.cat + ' &mdash; ' + t.dept + '</div><span class="kt-badge ' + badgeClass + '">' + t.status + '</span></div>'
                  + '<div class="kt-tender-title">' + t.title + '</div>'
                  + '<div class="kt-tender-ref">Ref: ' + t.id + '</div>'
                  + '<div class="kt-tender-meta">'
                  + '<div class="kt-meta-item"><div class="kt-meta-label">Est. Value</div><div class="kt-meta-val">' + t.value + '</div></div>'
                  + '<div class="kt-meta-item"><div class="kt-meta-label">Closing Date</div><div class="kt-meta-val ' + (t.daysLeft <= 7 ? 'danger' : '') + '">' + t.deadline + '</div></div>'
                  + '<div class="kt-meta-item"><div class="kt-meta-label">Days Left</div><div class="kt-meta-val ' + (t.daysLeft <= 7 ? 'danger' : 'success') + '">' + t.daysLeft + ' days</div></div>'
                  + '<div class="kt-meta-item"><div class="kt-meta-label">Category</div><div class="kt-meta-val">' + t.cat + '</div></div>'
                  + '</div>'
                  + '<div class="kt-tender-footer"><div style="flex:1;margin-right:14px;">'
                  + '<div class="kt-deadline-text"><span>Deadline progress</span><span>' + t.pct + '%</span></div>'
                  + '<div class="kt-deadline-track"><div class="kt-deadline-fill ' + barClass + '" style="width:' + t.pct + '%"></div></div>'
                  + '</div><button class="kt-tender-btn" onclick="openModal(\'login\')">View &amp; Bid &#8594;</button></div>'
                  + '</div>';
          }).join('');

          // Update pagination
          var totalPages = Math.ceil(filtered.length / itemsPerPage);
          for (var i = 1; i <= 3; i++) {
              var btn = document.getElementById('pg' + i);
              if (btn) { btn.className = 'kt-page-btn' + (i === currentPage ? ' active' : ''); btn.style.display = i <= totalPages ? '' : 'none'; }
          }
      }

      function filterTenders() {
          var q = document.getElementById('tenderSearch').value.toLowerCase();
          var cat = document.getElementById('catFilter').value;
          var dept = document.getElementById('deptFilter').value;
          filtered = tenders.filter(function (t) {
              return (!q || t.title.toLowerCase().includes(q) || t.id.toLowerCase().includes(q) || t.dept.toLowerCase().includes(q))
                  && (!cat || t.cat === cat)
                  && (!dept || t.dept === dept);
          });
          currentPage = 1;
          renderTenders();
      }

      function clearFilters() {
          document.getElementById('tenderSearch').value = '';
          document.getElementById('catFilter').value = '';
          document.getElementById('deptFilter').value = '';
          filtered = tenders.slice(); currentPage = 1; renderTenders();
      }

      function changePage(d) {
          var total = Math.ceil(filtered.length / itemsPerPage);
          currentPage = Math.max(1, Math.min(total, currentPage + d));
          renderTenders();
      }
      function setPage(p) { currentPage = p; renderTenders(); }

      renderTenders();

      /* ── Modal ── */
      function openModal(tab) {
          document.getElementById('authOverlay').classList.add('open');
          switchTab(tab || 'login');
          document.body.style.overflow = 'hidden';
      }
      function closeModal() {
          document.getElementById('authOverlay').classList.remove('open');
          document.body.style.overflow = '';
      }
      function closeModalOnOverlay(e) {
          if (e.target === document.getElementById('authOverlay')) closeModal();
      }
      function switchTab(tab) {
          document.getElementById('tabLogin').className = 'kt-modal-tab' + (tab === 'login' ? ' active' : '');
          document.getElementById('tabRegister').className = 'kt-modal-tab' + (tab === 'register' ? ' active' : '');
          document.getElementById('panelLogin').className = 'kt-tab-panel' + (tab === 'login' ? ' active' : '');
          document.getElementById('panelRegister').className = 'kt-tab-panel' + (tab === 'register' ? ' active' : '');
      }
      document.addEventListener('keydown', function (e) { if (e.key === 'Escape') closeModal(); });

      /* ── Toast ── */
      function showToast(ico, title, msg) {
          document.getElementById('toastIco').innerHTML = ico;
          document.getElementById('toastTitle').innerHTML = title;
          document.getElementById('toastMsg').innerHTML = msg;
          var t = document.getElementById('ktToast');
          t.classList.add('show');
          setTimeout(function () { t.classList.remove('show'); }, 4000);
      }

      function handleLogin() {
          closeModal();
          showToast('&#128274;', 'Login Successful', 'Welcome back! Redirecting to dashboard…');
      }
      function handleRegister() {
          closeModal();
          showToast('&#9989;', 'Registration Submitted', 'Verification email sent. Please check your inbox.');
      }
      function submitContact() {
          var fn = document.getElementById('cfFirstName').value;
          var em = document.getElementById('cfEmail').value;
          var msg = document.getElementById('cfMessage').value;
          if (!fn || !em || !msg) { showToast('&#9888;', 'Incomplete Form', 'Please fill all required fields.'); return; }
          showToast('&#128232;', 'Message Sent!', 'Thank you. We\'ll respond within 1-2 working days.');
          document.getElementById('cfFirstName').value = '';
          document.getElementById('cfLastName').value = '';
          document.getElementById('cfEmail').value = '';
          document.getElementById('cfPhone').value = '';
          document.getElementById('cfMessage').value = '';
          document.getElementById('cfType').value = '';
      }

      /* ── Scroll spy ── */
      function scrollTo(id) {
          var el = document.getElementById(id);
          if (el) el.scrollIntoView({ behavior: 'smooth' });
      }

      window.addEventListener('scroll', function () {
          var hdr = document.getElementById('kt-header');
          if (window.scrollY > 10) hdr.classList.add('scrolled'); else hdr.classList.remove('scrolled');

          var sections = ['home', 'tenders', 'about', 'contact'];
          var active = 'home';
          sections.forEach(function (s) {
              var el = document.getElementById(s);
              if (el && el.getBoundingClientRect().top <= 100) active = s;
          });
          sections.forEach(function (s) {
              var btn = document.getElementById('nav-' + s);
              if (btn) btn.className = 'kt-nav-link' + (s === active ? ' active' : '');
          });
      });

      /* ── Mobile nav ── */
      function toggleMobileNav() {
          document.getElementById('kt-mobile-nav').classList.toggle('open');
      }
      function closeMobileNav() {
          document.getElementById('kt-mobile-nav').classList.remove('open');
      }
  </script>
</asp:Content>


