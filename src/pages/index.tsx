import HelloName from '../components/HelloName';
import styles from '../styles/helloName.module.css';
export async function getServerSideProps() {
  const name = process.env.NAME || 'Default Name';
  const test = process.env.TEST || 'Default Test';
  return { props: { name, test } };
}

export default function Index({ name, test }: { name: string, test: string }) {
  return <div className={styles.center}>
    <HelloName name={`NAME : ${name}`} />
    <HelloName name={`TEST : ${test}`} />
  </div>;
}
