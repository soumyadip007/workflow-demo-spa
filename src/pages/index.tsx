import HelloName from '../components/HelloName';
import styles from '../styles/helloName.module.css';
export async function getServerSideProps() {
  const name = process.env.NAME || 'Default Name';
  const test = process.env.TEST ;
  return { props: { name } };
}

export default function Index({ name }: { name: string }) {
  return <div className={styles.center}>
    <HelloName name={name} />
    <HelloName name={test} />
  </div>;
}
