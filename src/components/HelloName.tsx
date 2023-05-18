import React from 'react';
import styles from '../styles/helloName.module.css';

type HelloNameProps = {
    name: string;
};

const HelloName: React.FC<HelloNameProps> = ({ name }) => {
    return <h1 className={styles.helloName}>[Config] {name}</h1>;
};

export default HelloName;

