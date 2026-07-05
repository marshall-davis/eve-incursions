import {useEffect, useState} from 'react';
import styles from '../styles/prose.module.css';

export default function About() {
  const [mail, setMail] = useState('');

  useEffect(() => {
    setMail('toothlessrebel@gmail.com');
  }, []);

  return (
    <div className={styles.prose}>
      <h1>About</h1>
      <p>If you have any feedback, bugs, questions or feature requests, you can contact me through the following channels.</p>
      <dl className={styles.contact}>
        <dt>Ingame</dt>
        <dd>Rackar al'Ulqua <span className={styles.note}></span></dd>

        <dt>Email</dt>
        <dd>{mail ? <a href={`mailto:${mail}`}>{mail}</a> : <span className={styles.note}>loading…</span>}</dd>
      </dl>
    </div>
  );
}
