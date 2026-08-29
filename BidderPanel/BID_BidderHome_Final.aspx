<%@ Page Title="Home - SRM E-Procurement Platform" Language="C#" MasterPageFile="~/Default/BidderMasterWithoutLogin.master" AutoEventWireup="true" CodeFile="BID_BidderHome_Final.aspx.cs" Inherits="BidderPanel_BID_BidderHome_Final" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* ═══════════════════════════════
           BASE RESET & TOKENS
        ═══════════════════════════════ */
        *, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }
        html { scroll-behavior:smooth; }

        :root {
            --ink:    #0c0c0c;
            --white:  #ffffff;
            --g50:    #f8f9fa;
            --g100:   #f1f3f5;
            --g200:   #dee2e6;
            --g400:   #adb5bd;  
            --g600:   #495057;
            --r-sm:   8px;
            --r-md:   16px;
            --r-lg:   24px;
            --sh:     0 4px 24px rgba(0,0,0,.08);
            --sh-lg:  0 16px 56px rgba(0,0,0,.14);
        }

        body {
            font-family: 'Inter', sans-serif;
            color: var(--ink);
            background: var(--white);
            overflow-x: hidden;
            line-height: 1.65;
        }

        /* ═══════════════════════════════
           TOPBAR — INFO STRIP + NAV
        ═══════════════════════════════ */

        /* Top strip: contact info + auth buttons */
        .top-strip {
            background: var(--ink);
            padding: 0 52px;
            height: 44px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .strip-contacts {
            display: flex;
            align-items: center;
            gap: 28px;
        }
        .strip-contact-item {
            display: flex;
            align-items: center;
            gap: 7px;
            font-size: 12px;
            color: rgba(255,255,255,.65);
            text-decoration: none;
            font-weight: 500;
            transition: color .2s;
        }
        .strip-contact-item:hover { color: white; }
        .strip-contact-item i { font-size: 11px; color: rgba(255,255,255,.45); }

        .strip-sep { width: 1px; height: 16px; background: rgba(255,255,255,.12); }

        .strip-auth {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .strip-btn-signin {
            font-family: 'Inter', sans-serif;
            font-size: 12px; font-weight: 600;
            color: rgba(255,255,255,.75);
            background: transparent;
            border: 1px solid rgba(255,255,255,.2);
            border-radius: 50px;
            padding: 5px 16px;
            cursor: pointer; text-decoration: none;
            display: inline-flex; align-items: center; gap: 6px;
            transition: all .2s;
        }
        .strip-btn-signin:hover { color: white; border-color: rgba(255,255,255,.5); }

        .strip-btn-register {
            font-family: 'Inter', sans-serif;
            font-size: 12px; font-weight: 700;
            color: var(--ink);
            background: white;
            border: none;
            border-radius: 50px;
            padding: 6px 18px;
            cursor: pointer; text-decoration: none;
            display: inline-flex; align-items: center; gap: 6px;
            transition: all .2s;
        }
        .strip-btn-register:hover { background: #e9ecef; }

        /* Main nav bar */
        .topbar {
            position: sticky;
            top: 0; left: 0; right: 0; z-index: 1000;
            display: flex; align-items: center; justify-content: space-between;
            padding: 0 52px; height: 64px;
            background: rgba(255,255,255,.96);
            backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--g200);
            transition: box-shadow .3s;
        }
        .topbar.scrolled { box-shadow: 0 4px 24px rgba(0,0,0,.07); }

        .topbar-logo {
            font-family: 'Syne', sans-serif;
            font-size: 20px; font-weight: 800;
            color: var(--ink); letter-spacing: -.5px;
            text-decoration: none;
            display: flex; align-items: center; gap: 10px;
        }
        .logo-badge {
            width: 34px; height: 34px;
            background: var(--ink); color: white;
            border-radius: 8px;
            display: flex; align-items: center; justify-content: center;
            font-size: 16px; font-weight: 800;
        }

        .topbar-nav { display: flex; align-items: center; gap: 2px; }
        .nav-link {
            font-size: 14px; font-weight: 500; color: var(--g600);
            text-decoration: none; padding: 7px 14px;
            border-radius: var(--r-sm); transition: all .2s;
        }
        .nav-link:hover, .nav-link.active { color: var(--ink); background: var(--g100); }

        /* ═══════════════════════════════
           HERO — SPLIT LAYOUT
        ═══════════════════════════════ */
        .hero-section {
            display: grid;
            grid-template-columns: 1fr 1fr;
            min-height: calc(100vh - 108px);
            background: var(--white);
            position: relative;
            overflow: hidden;
        }

        /* Left text panel */
        .hero-left {
            padding: 80px 64px 80px 52px;
            display: flex; flex-direction: column; justify-content: center;
            position: relative; z-index: 2;
        }

        .hero-eyebrow {
            display: inline-flex; align-items: center; gap: 8px;
            background: var(--g100); border: 1px solid var(--g200);
            border-radius: 50px; padding: 5px 14px;
            font-size: 11px; font-weight: 700; color: var(--g600);
            text-transform: uppercase; letter-spacing: 1.2px;
            margin-bottom: 24px; width: fit-content;
        }
        .live-dot {
            width: 7px; height: 7px; background: #22c55e;
            border-radius: 50%; animation: blink 2s ease infinite;
        }
        @keyframes blink { 0%,100%{opacity:1;} 50%{opacity:.3;} }

        .hero-title {
            font-family: 'Syne', sans-serif;
            font-size: clamp(38px, 4.5vw, 64px);
            font-weight: 800; color: var(--ink);
            line-height: 1.08; letter-spacing: -2px;
            margin-bottom: 24px;
        }
        .hero-title em {
            font-style: normal;
            background: linear-gradient(135deg, #0c0c0c 0%, #555 100%);
            -webkit-background-clip: text; -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .hero-desc {
            font-size: 17px; color: var(--g600);
            line-height: 1.82; margin-bottom: 40px; max-width: 480px;
        }

        .hero-btns { display: flex; gap: 12px; flex-wrap: wrap; margin-bottom: 56px; }

        .btn-solid {
            font-family: 'Inter', sans-serif;
            font-size: 15px; font-weight: 600; color: white;
            background: var(--ink); border: none; border-radius: 50px;
            padding: 14px 32px; cursor: pointer; text-decoration: none;
            display: inline-flex; align-items: center; gap: 8px;
            box-shadow: 0 6px 20px rgba(0,0,0,.18); transition: all .3s;
        }
        .btn-solid:hover { transform: translateY(-2px); box-shadow: 0 12px 32px rgba(0,0,0,.26); color: white; }

        .btn-ghost {
            font-family: 'Inter', sans-serif;
            font-size: 15px; font-weight: 600; color: var(--ink);
            background: transparent; border: 1.5px solid var(--g200);
            border-radius: 50px; padding: 14px 32px; cursor: pointer;
            text-decoration: none; display: inline-flex; align-items: center; gap: 8px;
            transition: all .3s;
        }
        .btn-ghost:hover { border-color: var(--ink); background: var(--g50); transform: translateY(-2px); }

        /* Hero stats row */
        .hero-stats {
            display: flex; gap: 32px; flex-wrap: wrap; align-items: center;
            padding-top: 32px; border-top: 1px solid var(--g200);
        }
        .h-stat { display: flex; flex-direction: column; gap: 2px; }
        .h-stat-num {
            font-family: 'Syne', sans-serif;
            font-size: 26px; font-weight: 800; color: var(--ink); letter-spacing: -1px;
        }
        .h-stat-lbl { font-size: 12px; color: var(--g400); font-weight: 500; }
        .h-stat-sep { width: 1px; height: 32px; background: var(--g200); }

        /* Right visual panel */
        .hero-right {
            background: var(--ink);
            position: relative; overflow: hidden;
            display: flex; align-items: center; justify-content: center;
            padding: 60px 52px;
        }
        /* concentric rings decoration */
        .hero-right::before, .hero-right::after {
            content: ''; position: absolute; border-radius: 50%;
            border: 1.5px solid rgba(255,255,255,.06);
        }
        .hero-right::before { width: 700px; height: 700px; top: -200px; right: -200px; }
        .hero-right::after  { width: 460px; height: 460px; top: -80px;  right: -80px;  }

        .hero-right-inner {
            position: relative; z-index: 2;
            display: flex; flex-direction: column; gap: 16px;
            width: 100%; max-width: 380px;
        }
        .hr-ring3 {
            position: absolute; border-radius: 50%;
            border: 1.5px solid rgba(255,255,255,.06);
            width: 280px; height: 280px; top: 40px; right: -60px;
        }

        /* Feature pills stacked on dark bg */
        .hero-feat-pill {
            background: rgba(255,255,255,.07);
            border: 1px solid rgba(255,255,255,.12);
            border-radius: var(--r-md);
            padding: 18px 22px;
            display: flex; align-items: center; gap: 16px;
            transition: background .3s;
        }
        .hero-feat-pill:hover { background: rgba(255,255,255,.12); }
        .pill-icon {
            width: 44px; height: 44px; flex-shrink: 0;
            background: rgba(255,255,255,.1); border-radius: 12px;
            display: flex; align-items: center; justify-content: center;
            font-size: 20px; color: white;
        }
        .pill-text h4 {
            font-family: 'Syne', sans-serif;
            font-size: 15px; font-weight: 700; color: white; margin-bottom: 3px;
        }
        .pill-text p { font-size: 12px; color: rgba(255,255,255,.55); line-height: 1.5; }

        /* ═══════════════════════════════
           SECTION SHARED
        ═══════════════════════════════ */
        .sec { padding: 90px 52px; }
        .sec-inner { max-width: 1240px; margin: 0 auto; }

        /* Section label — redesigned: number badge + line */
        .sec-label {
            display: flex; align-items: center; gap: 12px;
            margin-bottom: 16px;
        }
        .sec-label-num {
            width: 28px; height: 28px;
            background: var(--ink); color: white;
            border-radius: 8px;
            font-family: 'Syne', sans-serif;
            font-size: 12px; font-weight: 800;
            display: flex; align-items: center; justify-content: center;
            flex-shrink: 0;
        }
        .sec-label-text {
            font-size: 11px; font-weight: 700; color: var(--g400);
            text-transform: uppercase; letter-spacing: 1.8px;
        }
        .sec-label-line {
            flex: 1; height: 1px; background: var(--g200);
        }

        .sec-title {
            font-family: 'Syne', sans-serif;
            font-size: clamp(28px, 3.5vw, 46px); font-weight: 800;
            color: var(--ink); letter-spacing: -1.5px; line-height: 1.1; margin-bottom: 14px;
        }
        .sec-desc { font-size: 16px; color: var(--g600); max-width: 520px; line-height: 1.75; }
        .sec-hdr-row { display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 48px; gap: 24px; }

        /* ═══════════════════════════════
           OPPORTUNITIES
        ═══════════════════════════════ */
        .opp-section { background: var(--white); }

        .btn-viewall {
            font-family: 'Inter', sans-serif;
            font-size: 13px; font-weight: 600; color: var(--ink);
            background: var(--g100); border: none; border-radius: 50px;
            padding: 10px 22px; cursor: pointer; text-decoration: none; white-space: nowrap;
            display: inline-flex; align-items: center; gap: 7px; transition: all .25s;
        }
        .btn-viewall:hover { background: var(--ink); color: white; }

        .opp-wrap { position: relative; overflow: hidden; margin: 0 -52px; padding: 0 52px; }
        .opp-rail { display: flex; gap: 22px; overflow-x: auto; scroll-behavior: smooth; scrollbar-width: none; padding-bottom: 20px; }
        .opp-rail::-webkit-scrollbar { display: none; }

        .opp-card {
            flex: 0 0 320px; background: var(--white);
            border: 1px solid var(--g200); border-radius: var(--r-lg); overflow: hidden;
            transition: all .35s cubic-bezier(.4,0,.2,1);
        }
        .opp-card:hover { transform: translateY(-8px); box-shadow: var(--sh-lg); border-color: transparent; }

        .opp-card-hdr {
            padding: 20px 22px 16px; background: var(--g50);
            border-bottom: 1px solid var(--g100);
            display: flex; align-items: center; gap: 12px;
        }
        .opp-logo {
            width: 46px; height: 46px; background: white;
            border-radius: 10px; border: 1px solid var(--g200);
            display: flex; align-items: center; justify-content: center; flex-shrink: 0; overflow: hidden;
        }
        .opp-logo img { max-width: 32px; max-height: 32px; object-fit: contain; }
        .opp-co { font-size: 11px; font-weight: 700; color: var(--g600); text-transform: uppercase; letter-spacing: .8px; }
        .opp-badge {
            margin-left: auto; padding: 3px 9px;
            background: #fef3c7; color: #b45309;
            font-size: 10px; font-weight: 700; text-transform: uppercase;
            letter-spacing: .8px; border-radius: 50px; border: 1px solid #fde68a; white-space: nowrap;
        }

        .opp-card-body { padding: 20px 22px 24px; }
        .opp-title {
            font-family: 'Syne', sans-serif; font-size: 15px; font-weight: 700;
            color: var(--ink); line-height: 1.5; margin-bottom: 16px; min-height: 46px;
            display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;
        }
        .opp-meta { display: flex; gap: 8px; margin-bottom: 16px; }
        .opp-chip {
            flex: 1; padding: 9px 11px;
            background: var(--g50); border: 1px solid var(--g100); border-radius: var(--r-sm);
        }
        .opp-chip-lbl { font-size: 10px; color: var(--g400); text-transform: uppercase; letter-spacing: .5px; font-weight: 600; margin-bottom: 3px; }
        .opp-chip-val { font-size: 13px; font-weight: 700; color: var(--ink); display: flex; align-items: center; gap: 5px; }
        .opp-chip-val.urgent { color: #dc2626; }

        .opp-btn {
            width: 100%; padding: 12px; background: var(--ink); color: white;
            border: none; border-radius: var(--r-sm);
            font-family: 'Inter', sans-serif; font-size: 13px; font-weight: 700;
            cursor: pointer; text-decoration: none;
            display: flex; align-items: center; justify-content: center; gap: 7px;
            transition: all .25s;
        }
        .opp-btn:hover { background: #1f2937; transform: translateY(-1px); color: white; }

        .scroll-btn {
            position: absolute; top: 50%; transform: translateY(-50%);
            width: 40px; height: 40px; background: white;
            border: 1px solid var(--g200); border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            cursor: pointer; z-index: 10; transition: all .25s;
            box-shadow: var(--sh); font-size: 14px; color: var(--ink);
        }
        .scroll-btn:hover { background: var(--ink); color: white; border-color: var(--ink); }
        .scroll-btn.l { left: 4px; }
        .scroll-btn.r { right: 4px; }
        @media(max-width:900px) { .scroll-btn { display: none; } }

        /* ═══════════════════════════════
           HOW IT WORKS
        ═══════════════════════════════ */
        .process-section { background: var(--g50); }
        .process-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 2px; margin-top: 48px; background: var(--g200); border-radius: var(--r-lg); overflow: hidden; }
        .proc-step {
            background: white; padding: 40px 32px; text-align: center;
            transition: background .3s;
        }
        .proc-step:hover { background: var(--g50); }
        .step-num {
            width: 56px; height: 56px; background: var(--ink); color: white;
            border-radius: 16px; display: flex; align-items: center; justify-content: center;
            font-family: 'Syne', sans-serif; font-size: 22px; font-weight: 800;
            margin: 0 auto 18px; transition: transform .3s;
        }
        .proc-step:hover .step-num { transform: rotate(-6deg) scale(1.1); }
        .proc-step h3 { font-family: 'Syne', sans-serif; font-size: 17px; font-weight: 700; color: var(--ink); margin-bottom: 8px; }
        .proc-step p { font-size: 13px; color: var(--g600); line-height: 1.7; }

        /* ═══════════════════════════════
           FEATURES
        ═══════════════════════════════ */
        .feat-section { background: var(--white); }
        .feat-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); gap: 18px; }
        .feat-card {
            background: var(--g50); border: 1px solid var(--g200);
            border-radius: var(--r-md); padding: 32px 28px;
            transition: all .3s; position: relative; overflow: hidden;
        }
        .feat-card::after {
            content: ''; position: absolute;
            bottom: 0; left: 0; right: 0; height: 3px;
            background: var(--ink); transform: scaleX(0); transform-origin: left; transition: transform .3s;
        }
        .feat-card:hover::after { transform: scaleX(1); }
        .feat-card:hover { transform: translateY(-5px); box-shadow: var(--sh); background: white; }
        .feat-icon {
            width: 48px; height: 48px; background: var(--ink);
            border-radius: 12px; display: flex; align-items: center; justify-content: center;
            font-size: 22px; color: white; margin-bottom: 20px;
        }
        .feat-card h3 { font-family: 'Syne', sans-serif; font-size: 17px; font-weight: 700; color: var(--ink); margin-bottom: 8px; }
        .feat-card p { font-size: 13px; color: var(--g600); line-height: 1.75; }

        /* ═══════════════════════════════
           ABOUT US
        ═══════════════════════════════ */
        .about-section { background: var(--g50); }

        .about-story { display: grid; grid-template-columns: 1fr 1fr; gap: 72px; align-items: start; margin-bottom: 52px; }
        @media(max-width:900px) { .about-story { grid-template-columns: 1fr; gap: 36px; } }

        .about-story-title {
            font-family: 'Syne', sans-serif;
            font-size: clamp(28px, 3.5vw, 46px); font-weight: 800; color: var(--ink);
            letter-spacing: -1.5px; line-height: 1.1; margin-bottom: 18px;
        }
        .about-body { font-size: 15px; color: var(--g600); line-height: 1.85; }

        .about-pills { display: flex; flex-wrap: wrap; gap: 8px; margin-top: 22px; }
        .about-pill {
            display: inline-flex; align-items: center; gap: 7px;
            background: var(--ink); color: white; border-radius: 50px;
            padding: 7px 16px; font-size: 12px; font-weight: 600;
        }

        .about-cards { display: flex; flex-direction: column; gap: 14px; }
        .about-mini {
            background: white; border: 1px solid var(--g200); border-radius: var(--r-md);
            padding: 24px 26px; display: flex; gap: 16px; align-items: flex-start; transition: all .3s;
        }
        .about-mini:hover { transform: translateX(5px); box-shadow: var(--sh); }
        .about-mini-icon {
            width: 44px; height: 44px; flex-shrink: 0;
            background: var(--ink); border-radius: 11px;
            display: flex; align-items: center; justify-content: center;
            font-size: 20px; color: white;
        }
        .about-mini h4 { font-family: 'Syne', sans-serif; font-size: 15px; font-weight: 700; color: var(--ink); margin-bottom: 5px; }
        .about-mini p { font-size: 13px; color: var(--g600); line-height: 1.65; }

        .about-stats {
            display: grid; grid-template-columns: repeat(4, 1fr);
            background: var(--ink); border-radius: var(--r-md); overflow: hidden;
        }
        @media(max-width:768px) { .about-stats { grid-template-columns: repeat(2, 1fr); } }
        .about-stat { padding: 40px 28px; text-align: center; border-right: 1px solid rgba(255,255,255,.08); }
        .about-stat:last-child { border-right: none; }
        .about-stat h2 { font-family: 'Syne', sans-serif; font-size: 36px; font-weight: 800; color: white; letter-spacing: -1.5px; margin-bottom: 6px; }
        .about-stat p { font-size: 11px; color: rgba(255,255,255,.45); font-weight: 600; text-transform: uppercase; letter-spacing: 1.2px; }

        /* ═══════════════════════════════
           CONTACT — DARK THEME
        ═══════════════════════════════ */
        .contact-section {
            background: #0c0c0c; position: relative; overflow: hidden; padding: 0;
        }

        .c-rings { position: absolute; inset: 0; pointer-events: none; overflow: hidden; }
        .c-rings span { position: absolute; border-radius: 50%; border: 1px solid rgba(255,255,255,.05); }
        .c-rings span:nth-child(1) { width:900px;  height:900px;  top:-320px; right:-240px; }
        .c-rings span:nth-child(2) { width:650px;  height:650px;  top:-170px; right:-100px; }
        .c-rings span:nth-child(3) { width:430px;  height:430px;  top:-50px;  right:30px;  }
        .c-rings span:nth-child(4) { width:230px;  height:230px;  top:80px;   right:160px; }

        .contact-body {
            display: grid; grid-template-columns: 1fr 1.6fr;
            max-width: 1400px; margin: 0 auto;
            position: relative; z-index: 2;
        }
        @media(max-width:900px) { .contact-body { grid-template-columns: 1fr; } }

        .c-left {
            padding: 64px 56px 64px 52px;
            display: flex; flex-direction: column; justify-content: center;
            border-right: 1px solid rgba(255,255,255,.1);
        }
        @media(max-width:900px) { .c-left { border-right: none; border-bottom: 1px solid rgba(255,255,255,.1); padding: 48px 24px; } }

        .c-brand {
            font-family: 'Syne', sans-serif;
            font-size: clamp(36px, 5vw, 64px); font-weight: 800;
            color: white; letter-spacing: -2.5px; line-height: 1.05; margin-bottom: 8px;
        }
        .c-brand sup { font-size: .36em; vertical-align: super; font-weight: 700; }
        .c-sub { font-size: 16px; color: rgba(255,255,255,.5); font-weight: 500; }

        .c-right {
            padding: 64px 52px 64px 56px;
            display: flex; flex-direction: column; justify-content: center; gap: 28px;
        }
        @media(max-width:900px) { .c-right { padding: 36px 24px; } }

        .c-loc { display: flex; align-items: flex-start; gap: 18px; }
        .c-loc-icon {
            width: 48px; height: 48px; flex-shrink: 0;
            background: rgba(255,255,255,.1); border-radius: 12px;
            border: 1px solid rgba(255,255,255,.15);
            display: flex; align-items: center; justify-content: center;
            font-size: 22px; color: white;
        }
        .c-loc-title { font-family: 'Syne', sans-serif; font-size: 18px; font-weight: 700; color: white; margin-bottom: 6px; }
        .c-loc-addr { font-size: 14px; color: rgba(255,255,255,.65); line-height: 1.85; }
        .c-loc-addr strong { color: white; font-weight: 700; display: block; margin-bottom: 1px; }

        .c-info-row { display: grid; grid-template-columns: repeat(3, 1fr); gap: 16px; }
        @media(max-width:700px) { .c-info-row { grid-template-columns: 1fr; } }

        .c-info-item {
            background: rgba(255,255,255,.07); border: 1px solid rgba(255,255,255,.12);
            border-radius: 12px; padding: 18px; transition: background .3s;
        }
        .c-info-item:hover { background: rgba(255,255,255,.14); }
        .c-info-icon { font-size: 18px; color: rgba(255,255,255,.6); margin-bottom: 8px; }
        .c-info-lbl { font-size: 10px; color: rgba(255,255,255,.4); text-transform: uppercase; letter-spacing: 1px; font-weight: 700; margin-bottom: 4px; }
        .c-info-val { font-size: 14px; color: white; font-weight: 600; }
        .c-info-val a { color: white; text-decoration: none; }
        .c-info-val a:hover { text-decoration: underline; }
        .c-info-note { font-size: 11px; color: rgba(255,255,255,.35); margin-top: 2px; }

        .c-map { position: relative; z-index: 2; height: 320px; border-top: 1px solid rgba(255,255,255,.08); }
        .c-map iframe { position: absolute; inset: 0; width: 100%; height: 100%; border: 0; }

        .c-footer {
            background: rgba(0,0,0,.4); padding: 16px 52px;
            display: flex; align-items: center; justify-content: center;
            position: relative; z-index: 2; border-top: 1px solid rgba(255,255,255,.06);
        }
        .c-footer p { font-size: 12px; color: rgba(255,255,255,.35); text-align: center; }
        .c-footer a { color: rgba(255,255,255,.6); text-decoration: none; }
        .c-footer a:hover { color: white; }

        /* ═══════════════════════════════
           REVEAL ANIMATIONS
        ═══════════════════════════════ */
        .reveal { opacity: 0; transform: translateY(24px); transition: opacity .65s ease, transform .65s ease; }
        .reveal.in { opacity: 1; transform: translateY(0); }
        .reveal-d1 { transition-delay: .1s; }
        .reveal-d2 { transition-delay: .2s; }
        .reveal-d3 { transition-delay: .3s; }

        /* ═══════════════════════════════
           RESPONSIVE
        ═══════════════════════════════ */
        @media(max-width:768px) {
            .top-strip { padding: 0 20px; }
            .strip-contacts { gap: 14px; }
            .strip-contact-item span { display: none; }
            .topbar { padding: 0 20px; }
            .topbar-nav { display: none; }
            .hero-section { grid-template-columns: 1fr; min-height: auto; }
            .hero-left { padding: 60px 20px 40px; }
            .hero-right { padding: 40px 20px; min-height: 360px; }
            .sec { padding: 64px 20px; }
            .opp-wrap { margin: 0 -20px; padding: 0 20px; }
            .sec-hdr-row { flex-direction: column; align-items: flex-start; }
            .c-left { padding: 48px 20px; }
            .c-right { padding: 36px 20px; }
            .c-footer { padding: 16px 20px; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphBreadcrumb" runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphPageContent" runat="Server">
    <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="upBID_Home" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>

            <!-- ═══════════════════ TOP STRIP ═══════════════════ -->
            <div class="top-strip">
                <div class="strip-contacts">
                    <a class="strip-contact-item" href="tel:+919856234185">
                        <i class="fa fa-phone"></i>
                        <span>+91 98562 34185</span>
                    </a>
                    <div class="strip-sep"></div>
                    <a class="strip-contact-item" href="mailto:admin@srmhub.com">
                        <i class="fa fa-envelope"></i>
                        <span>admin@srmhub.com</span>
                    </a>
                    <div class="strip-sep"></div>
                    <span class="strip-contact-item">
                        <i class="fa fa-clock-o"></i>
                        <span>Mon – Fri &nbsp;9am – 6pm</span>
                    </span>
                </div>
                <div class="strip-auth">
                    <asp:LinkButton ID="btnSignIn" runat="server" CssClass="strip-btn-signin" OnClick="btnSignIn_Click">
                        <i class="fa fa-sign-in"></i> Sign In
                    </asp:LinkButton>
                    <asp:LinkButton ID="btnCreateAccount" runat="server" CssClass="strip-btn-register" OnClick="btnCreateAccount_Click">
                        <i class="fa fa-user-plus"></i> Register Free
                    </asp:LinkButton>
                </div>
            </div>

            <!-- ═══════════════════ MAIN TOPBAR ═══════════════════ -->
            <nav class="topbar" id="topbar">
                <a class="topbar-logo" href="#">
                    <span class="logo-badge">S</span>
                    SRM Procurement
                </a>
                <div class="topbar-nav">
                    <a class="nav-link" href="#home">Home</a>
                    <a class="nav-link" href="#opportunities">Opportunities</a>
                    <a class="nav-link" href="#features">Features</a>
                    <a class="nav-link" href="#about">About</a>
                    <a class="nav-link" href="#contact">Contact</a>
                </div>
            </nav>

            <!-- ═══════════════════ HERO — SPLIT ═══════════════════ -->
            <section class="hero-section" id="home">
                <!-- Left: text -->
                <div class="hero-left">
                    <div class="hero-eyebrow">
                        <div class="live-dot"></div>
                        Digital Procurement Platform
                    </div>
                    <h1 class="hero-title reveal">
                        Supplier Due-Diligence,<br/>
                        <em>Reimagined</em> for Africa
                    </h1>
                    <p class="hero-desc reveal reveal-d1">
                        SRM E-Procurement streamlines supplier management, sourcing, and tendering.
                        Enhance transparency, reduce risk, and boost efficiency through intelligent automation.
                    </p>
                    <div class="hero-btns reveal reveal-d2">
                        <asp:LinkButton ID="btnApplyTenders" runat="server" CssClass="btn-solid" OnClick="btnApplyTenders_Click">
                            <i class="fa fa-file-text"></i> Browse Tenders
                        </asp:LinkButton>
                        <a class="btn-ghost" href="#about">
                            <i class="fa fa-play-circle"></i> Learn More
                        </a>
                    </div>
                    <div class="hero-stats reveal reveal-d3">
                        <div class="h-stat"><span class="h-stat-num">500+</span><span class="h-stat-lbl">Active Suppliers</span></div>
                        <div class="h-stat-sep"></div>
                        <div class="h-stat"><span class="h-stat-num">120+</span><span class="h-stat-lbl">Live Tenders</span></div>
                        <div class="h-stat-sep"></div>
                        <div class="h-stat"><span class="h-stat-num">15+</span><span class="h-stat-lbl">Countries</span></div>
                        <div class="h-stat-sep"></div>
                        <div class="h-stat"><span class="h-stat-num">98%</span><span class="h-stat-lbl">Satisfaction</span></div>
                    </div>
                </div>

                <!-- Right: dark feature panel -->
                <div class="hero-right">
                    <div class="hr-ring3"></div>
                    <div class="hero-right-inner">
                        <div class="hero-feat-pill reveal">
                            <div class="pill-icon"><i class="fa fa-shield"></i></div>
                            <div class="pill-text">
                                <h4>Verified Supplier Network</h4>
                                <p>Pre-screened, KYC-verified suppliers ready for engagement</p>
                            </div>
                        </div>
                        <div class="hero-feat-pill reveal reveal-d1">
                            <div class="pill-icon"><i class="fa fa-bolt"></i></div>
                            <div class="pill-text">
                                <h4>Automated Workflows</h4>
                                <p>Tender-to-award process completed up to 60% faster</p>
                            </div>
                        </div>
                        <div class="hero-feat-pill reveal reveal-d2">
                            <div class="pill-icon"><i class="fa fa-line-chart"></i></div>
                            <div class="pill-text">
                                <h4>Real-Time Analytics</h4>
                                <p>Live dashboards with spend visibility and audit trails</p>
                            </div>
                        </div>
                        <div class="hero-feat-pill reveal reveal-d3">
                            <div class="pill-icon"><i class="fa fa-lock"></i></div>
                            <div class="pill-text">
                                <h4>Enterprise Security</h4>
                                <p>ISO-certified, GDPR-compliant cloud infrastructure</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ═══════════════════ LIVE OPPORTUNITIES ═══════════════════ -->
            <section class="sec opp-section" id="opportunities">
                <div class="sec-inner">
                    <div class="sec-hdr-row">
                        <div>
                            <div class="sec-label reveal">
                                <div class="sec-label-num">01</div>
                                <div class="sec-label-text">Live Now</div>
                                <div class="sec-label-line"></div>
                            </div>
                            <h2 class="sec-title reveal reveal-d1">Running Opportunities</h2>
                            <p class="sec-desc reveal reveal-d2">Curated procurement opportunities from leading organisations. Apply directly and grow your business.</p>
                        </div>
                        <asp:LinkButton ID="btnViewAll" runat="server" CssClass="btn-viewall reveal" OnClick="btnViewAll_Click">
                            View all <i class="fa fa-arrow-right"></i>
                        </asp:LinkButton>
                    </div>

                    <div class="opp-wrap">
                        <div class="scroll-btn l" onclick="scrollRail('left')"><i class="fa fa-chevron-left"></i></div>
                        <div class="scroll-btn r" onclick="scrollRail('right')"><i class="fa fa-chevron-right"></i></div>
                        <div class="opp-rail" id="oppRail">
                            <!-- Card 1 -->
                            <div class="opp-card reveal">
                                <div class="opp-card-hdr">
                                    <div class="opp-logo"><img src="~/assets/images/aar-logo.png" alt="AAR" runat="server"/></div>
                                    <span class="opp-co">AAR Insurance</span>
                                    <span class="opp-badge">★ Promoted</span>
                                </div>
                                <div class="opp-card-body">
                                    <h3 class="opp-title">AAR Insurance Supplier Prequalification 2025 to 2026</h3>
                                    <div class="opp-meta">
                                        <div class="opp-chip"><div class="opp-chip-lbl">Deadline</div><div class="opp-chip-val urgent"><i class="fa fa-clock-o"></i> 4 Days</div></div>
                                        <div class="opp-chip"><div class="opp-chip-lbl">Type</div><div class="opp-chip-val"><i class="fa fa-tag"></i> Tender</div></div>
                                    </div>
                                    <asp:LinkButton ID="btnViewDetails1" runat="server" CssClass="opp-btn" OnClick="btnViewDetails_Click" CommandArgument="1">View Details <i class="fa fa-arrow-right"></i></asp:LinkButton>
                                </div>
                            </div>
                            <!-- Card 2 -->
                            <div class="opp-card reveal reveal-d1">
                                <div class="opp-card-hdr">
                                    <div class="opp-logo"><img src="~/assets/images/fairtrade-logo.png" alt="Fairtrade" runat="server"/></div>
                                    <span class="opp-co">Fairtrade Africa</span>
                                    <span class="opp-badge">★ Promoted</span>
                                </div>
                                <div class="opp-card-body">
                                    <h3 class="opp-title">Fairtrade Africa – Tanzania Prequalification of Suppliers</h3>
                                    <div class="opp-meta">
                                        <div class="opp-chip"><div class="opp-chip-lbl">Deadline</div><div class="opp-chip-val"><i class="fa fa-clock-o"></i> 16 Days</div></div>
                                        <div class="opp-chip"><div class="opp-chip-lbl">Type</div><div class="opp-chip-val"><i class="fa fa-tag"></i> RFQ</div></div>
                                    </div>
                                    <asp:LinkButton ID="btnViewDetails2" runat="server" CssClass="opp-btn" OnClick="btnViewDetails_Click" CommandArgument="2">View Details <i class="fa fa-arrow-right"></i></asp:LinkButton>
                                </div>
                            </div>
                            <!-- Card 3 -->
                            <div class="opp-card reveal reveal-d2">
                                <div class="opp-card-hdr">
                                    <div class="opp-logo"><img src="~/assets/images/fairtrade-logo.png" alt="Fairtrade" runat="server"/></div>
                                    <span class="opp-co">Fairtrade Africa</span>
                                    <span class="opp-badge">★ Promoted</span>
                                </div>
                                <div class="opp-card-body">
                                    <h3 class="opp-title">Fairtrade Africa – Ethiopia Prequalification of Suppliers</h3>
                                    <div class="opp-meta">
                                        <div class="opp-chip"><div class="opp-chip-lbl">Deadline</div><div class="opp-chip-val"><i class="fa fa-clock-o"></i> 16 Days</div></div>
                                        <div class="opp-chip"><div class="opp-chip-lbl">Type</div><div class="opp-chip-val"><i class="fa fa-tag"></i> Tender</div></div>
                                    </div>
                                    <asp:LinkButton ID="btnViewDetails3" runat="server" CssClass="opp-btn" OnClick="btnViewDetails_Click" CommandArgument="3">View Details <i class="fa fa-arrow-right"></i></asp:LinkButton>
                                </div>
                            </div>
                            <!-- Card 4 -->
                            <div class="opp-card reveal reveal-d3">
                                <div class="opp-card-hdr">
                                    <div class="opp-logo"><img src="~/assets/images/fairtrade-logo.png" alt="Fairtrade" runat="server"/></div>
                                    <span class="opp-co">Fairtrade Africa</span>
                                    <span class="opp-badge">★ Promoted</span>
                                </div>
                                <div class="opp-card-body">
                                    <h3 class="opp-title">Fairtrade Africa – Rwanda Prequalification of Suppliers</h3>
                                    <div class="opp-meta">
                                        <div class="opp-chip"><div class="opp-chip-lbl">Deadline</div><div class="opp-chip-val"><i class="fa fa-clock-o"></i> 16 Days</div></div>
                                        <div class="opp-chip"><div class="opp-chip-lbl">Type</div><div class="opp-chip-val"><i class="fa fa-tag"></i> RFP</div></div>
                                    </div>
                                    <asp:LinkButton ID="btnViewDetails4" runat="server" CssClass="opp-btn" OnClick="btnViewDetails_Click" CommandArgument="4">View Details <i class="fa fa-arrow-right"></i></asp:LinkButton>
                                </div>
                            </div>
                            <!-- Card 5 -->
                            <div class="opp-card reveal">
                                <div class="opp-card-hdr">
                                    <div class="opp-logo"><img src="~/assets/images/fairtrade-logo.png" alt="Fairtrade" runat="server"/></div>
                                    <span class="opp-co">Fairtrade Africa</span>
                                    <span class="opp-badge">★ Promoted</span>
                                </div>
                                <div class="opp-card-body">
                                    <h3 class="opp-title">Kenya Regional Supplier Development Program 2025</h3>
                                    <div class="opp-meta">
                                        <div class="opp-chip"><div class="opp-chip-lbl">Deadline</div><div class="opp-chip-val"><i class="fa fa-clock-o"></i> 20 Days</div></div>
                                        <div class="opp-chip"><div class="opp-chip-lbl">Type</div><div class="opp-chip-val"><i class="fa fa-tag"></i> RFP</div></div>
                                    </div>
                                    <asp:LinkButton ID="btnViewDetails5" runat="server" CssClass="opp-btn" OnClick="btnViewDetails_Click" CommandArgument="5">View Details <i class="fa fa-arrow-right"></i></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ═══════════════════ HOW IT WORKS ═══════════════════ -->
            <section class="sec process-section">
                <div class="sec-inner">
                    <div class="sec-label reveal">
                        <div class="sec-label-num">02</div>
                        <div class="sec-label-text">Process</div>
                        <div class="sec-label-line"></div>
                    </div>
                    <h2 class="sec-title reveal reveal-d1">Simple & Streamlined</h2>
                    <p class="sec-desc reveal reveal-d2">Get started in minutes and transform your procurement workflow.</p>
                    <div class="process-grid">
                        <div class="proc-step reveal"><div class="step-num">1</div><h3>Register</h3><p>Create your account and set up your business profile with all required details.</p></div>
                        <div class="proc-step reveal reveal-d1"><div class="step-num">2</div><h3>Discover</h3><p>Browse available tenders, quotations, and pre-qualification opportunities.</p></div>
                        <div class="proc-step reveal reveal-d2"><div class="step-num">3</div><h3>Apply</h3><p>Submit your bids with all required documentation through our secure platform.</p></div>
                        <div class="proc-step reveal reveal-d3"><div class="step-num">4</div><h3>Win</h3><p>Get notified of results and manage your awarded contracts efficiently.</p></div>
                    </div>
                </div>
            </section>

            <!-- ═══════════════════ FEATURES ═══════════════════ -->
            <section class="sec feat-section" id="features">
                <div class="sec-inner">
                    <div class="sec-label reveal">
                        <div class="sec-label-num">03</div>
                        <div class="sec-label-text">Why Choose Us</div>
                        <div class="sec-label-line"></div>
                    </div>
                    <h2 class="sec-title reveal reveal-d1">A Fully-Featured Procurement Suite</h2>
                    <p class="sec-desc reveal reveal-d2" style="margin-bottom:48px;">From simple quotations to complex tenders, our platform handles it all with precision.</p>
                    <div class="feat-grid">
                        <div class="feat-card reveal"><div class="feat-icon"><i class="fa fa-shield"></i></div><h3>Transparency</h3><p>Complete visibility into procurement processes with real-time tracking and comprehensive audit trails.</p></div>
                        <div class="feat-card reveal reveal-d1"><div class="feat-icon"><i class="fa fa-bolt"></i></div><h3>Efficiency</h3><p>Automate workflows and reduce manual tasks, cutting procurement cycle time by up to 60%.</p></div>
                        <div class="feat-card reveal reveal-d2"><div class="feat-icon"><i class="fa fa-lock"></i></div><h3>Security</h3><p>Enterprise-grade security with encrypted data storage and secure authentication protocols.</p></div>
                        <div class="feat-card reveal"><div class="feat-icon"><i class="fa fa-users"></i></div><h3>Collaboration</h3><p>Seamless communication between buyers and suppliers with integrated messaging.</p></div>
                        <div class="feat-card reveal reveal-d1"><div class="feat-icon"><i class="fa fa-line-chart"></i></div><h3>Analytics</h3><p>Powerful insights and reporting tools to make data-driven procurement decisions.</p></div>
                        <div class="feat-card reveal reveal-d2"><div class="feat-icon"><i class="fa fa-mobile"></i></div><h3>Mobile Ready</h3><p>Access your procurement dashboard anywhere, anytime from any device.</p></div>
                    </div>
                </div>
            </section>

            <!-- ═══════════════════ ABOUT US ═══════════════════ -->
            <section class="sec about-section" id="about">
                <div class="sec-inner">
                    <div class="sec-label reveal">
                        <div class="sec-label-num">04</div>
                        <div class="sec-label-text">About Us</div>
                        <div class="sec-label-line"></div>
                    </div>

                    <div class="about-story">
                        <div>
                            <h2 class="about-story-title reveal reveal-d1">Powering Africa's<br/>Procurement Future</h2>
                            <p class="about-body reveal reveal-d2" style="margin-bottom:14px;">
                                SRM E-Procurement was built with a singular purpose: to make supplier due-diligence
                                digital, transparent, and efficient for organisations across Africa and beyond.
                                We believe great procurement starts with great supplier relationships.
                            </p>
                            <p class="about-body reveal reveal-d2">
                                Our platform brings buyers and suppliers into a trusted digital marketplace,
                                automating workflows that once took weeks into seamless, auditable processes
                                that take hours.
                            </p>
                            <div class="about-pills reveal reveal-d3">
                                <span class="about-pill"><i class="fa fa-check"></i> ISO Certified</span>
                                <span class="about-pill"><i class="fa fa-check"></i> GDPR Compliant</span>
                                <span class="about-pill"><i class="fa fa-check"></i> 24/7 Support</span>
                                <span class="about-pill"><i class="fa fa-check"></i> Cloud Native</span>
                            </div>
                        </div>
                        <div class="about-cards">
                            <div class="about-mini reveal">
                                <div class="about-mini-icon"><i class="fa fa-bullseye"></i></div>
                                <div><h4>Our Mission</h4><p>To deliver world-class digital procurement through innovation, transparency, and deep industry collaboration that benefits every stakeholder.</p></div>
                            </div>
                            <div class="about-mini reveal reveal-d1">
                                <div class="about-mini-icon"><i class="fa fa-eye"></i></div>
                                <div><h4>Our Vision</h4><p>To be Africa's most trusted e-procurement platform, fostering sustainable growth and integrity in supplier ecosystems.</p></div>
                            </div>
                            <div class="about-mini reveal reveal-d2">
                                <div class="about-mini-icon"><i class="fa fa-heart"></i></div>
                                <div><h4>Our Values</h4><p>Integrity, innovation, inclusiveness, and commitment to lifelong partnerships form the foundation of every decision we make.</p></div>
                            </div>
                        </div>
                    </div>

                    <div class="about-stats reveal">
                        <div class="about-stat"><h2>500+</h2><p>Registered Suppliers</p></div>
                        <div class="about-stat"><h2>120+</h2><p>Active Tenders</p></div>
                        <div class="about-stat"><h2>15+</h2><p>Countries Served</p></div>
                        <div class="about-stat"><h2>5+</h2><p>Years of Excellence</p></div>
                    </div>
                </div>
            </section>

            <!-- ═══════════════════ CONTACT ═══════════════════ -->
            <section class="contact-section" id="contact">
                <div class="c-rings">
                    <span></span><span></span><span></span><span></span>
                </div>

                <div class="contact-body">
                    <div class="c-left">
                        <div class="c-brand reveal"><b>SRM</b><sup>®</sup><br/>Procurement</div>
                        <div class="c-sub reveal reveal-d1">Nairobi, Kenya &amp; Pan-Africa</div>
                    </div>
                    <div class="c-right">
                        <div class="c-loc reveal">
                            <div class="c-loc-icon"><i class="fa fa-map-marker"></i></div>
                            <div>
                                <div class="c-loc-title">Main Office</div>
                                <div class="c-loc-addr">
                                    <strong><asp:Label ID="lblAddress" runat="server" Text="Parul University"></asp:Label></strong>
                                    <asp:Label ID="Label1" runat="server" Text="P.O. Limda, Ta. Waghodia – 391760"></asp:Label><br/>
                                    <asp:Label ID="Label2" runat="server" Text="Dist. Vadodara, Gujarat (India)"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="c-info-row">
                            <div class="c-info-item reveal">
                                <div class="c-info-icon"><i class="fa fa-phone"></i></div>
                                <div class="c-info-lbl">Call Us</div>
                                <div class="c-info-val"><a href="tel:+919856234185"><asp:Label ID="lblContactNo" runat="server" Text="+91 98562 34185"></asp:Label></a></div>
                                <div class="c-info-note">Mon–Fri, 9am–6pm</div>
                            </div>
                            <div class="c-info-item reveal reveal-d1">
                                <div class="c-info-icon"><i class="fa fa-envelope"></i></div>
                                <div class="c-info-lbl">Email Us</div>
                                <div class="c-info-val"><a href="mailto:admin@srmhub.com"><asp:Label ID="lblEmail" runat="server" Text="admin@srmhub.com"></asp:Label></a></div>
                                <div class="c-info-note">Reply within 24 hours</div>
                            </div>
                            <div class="c-info-item reveal reveal-d2">
                                <div class="c-info-icon"><i class="fa fa-comment"></i></div>
                                <div class="c-info-lbl">Live Support</div>
                                <div class="c-info-val"><a href="tel:+919856234185"><asp:Label ID="lblMessage" runat="server" Text="+91 98562 34185"></asp:Label></a></div>
                                <div class="c-info-note">Chat with our team</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="c-map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3690.4997867574443!2d73.30471931495484!3d22.363157985297668!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395fc8ab91a3ddab%3A0xac39d3bfe1473fb8!2sParul%20University!5e0!3m2!1sen!2sin!4v1234567890123!5m2!1sen!2sin"
                        allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>

                <div class="c-footer">
                    <p>Copyright &copy; 2026 &nbsp;|&nbsp; All rights reserved. &nbsp;<a href="#">srmhub.com</a></p>
                </div>
            </section>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cphScripts" runat="Server">
    <script>
        // Sticky topbar shadow
        window.addEventListener('scroll', function () {
            document.getElementById('topbar').classList.toggle('scrolled', window.scrollY > 10);
        });

        // Scroll opportunities rail
        function scrollRail(dir) {
            var rail = document.getElementById('oppRail');
            rail.scrollBy({ left: dir === 'left' ? -360 : 360, behavior: 'smooth' });
        }

        // Reveal on scroll + active nav
        $(document).ready(function () {
            var observer = new IntersectionObserver(function (entries) {
                entries.forEach(function (e) {
                    if (e.isIntersecting) e.target.classList.add('in');
                });
            }, { threshold: 0.10, rootMargin: '0px 0px -50px 0px' });

            document.querySelectorAll('.reveal').forEach(function (el) { observer.observe(el); });

            var ids = ['home', 'opportunities', 'features', 'about', 'contact'];
            var links = document.querySelectorAll('.topbar-nav .nav-link');
            window.addEventListener('scroll', function () {
                var y = window.scrollY + 80;
                ids.forEach(function (id, i) {
                    var el = document.getElementById(id);
                    if (!el) return;
                    if (y >= el.offsetTop && y < el.offsetTop + el.offsetHeight) {
                        links.forEach(function (l) { l.classList.remove('active'); });
                        if (links[i]) links[i].classList.add('active');
                    }
                });
            });
        });
    </script>
</asp:Content>
