import '../styles/tokens.css';
import '../styles/globals.css';
import '../styles/tables.css';
import '../styles/footer.css';
import {AppProps} from 'next/app';
import {useEffect} from 'react';
import Head from 'next/head';
import {Nav} from '../components/layout/Nav';

function MyApp({Component, pageProps}: AppProps) {
  useEffect(() => {
    if (!('serviceWorker' in navigator)) return;
    if (process.env.NODE_ENV === 'production') {
      navigator.serviceWorker.register('/sw.js').catch(() => {});
    } else {
      // A caching service worker against `next dev` serves stale/offline pages
      // and adds cold-boot latency to every navigation — make sure it's gone.
      navigator.serviceWorker.getRegistrations().then(regs => regs.forEach(r => r.unregister())).catch(() => {});
    }
  }, []);

  return (
    <>
      <Head>
        <title>EVE Incursions</title>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
      </Head>
      <div className="app">
        <Nav/>
        <main className="main">
          <div className="container">
            <Component {...pageProps} />
          </div>
        </main>
        <footer className="footer">
          <div className="container">
            <p>
              EVE Online, the EVE logo, EVE and all associated logos and designs are the intellectual property of Fenris Creations hf. All artwork, screenshots,
              characters, vehicles, storylines, world facts or other recognizable features of the intellectual property relating to these trademarks are
              likewise the intellectual property of Fenris Creations hf. EVE Online and the EVE logo are the registered trademarks of Fenris Creations hf. All rights are reserved
              worldwide. All other trademarks are the property of their respective owners. Fenris Creations is in no way responsible for the content on or functioning of this website, nor can it be liable
              for any damage arising from the use of this website.
            </p>
            <p>
              Thanks to <a href="https://github.com/Shadowlauch">Lars Naurath</a> for the original code and website.
            </p>
          </div>
        </footer>
      </div>
    </>
  );
}

export default MyApp;
