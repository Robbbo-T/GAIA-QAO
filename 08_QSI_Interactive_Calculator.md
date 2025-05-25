# QSI Interactive Calculator

The Quantum Sustainability Index (QSI) calculator lets you explore how the number of qubits dedicated to Environmental, Social, and Governance (ESG) tasks and their coherence time might affect a system’s conceptual sustainability score.

$$
QSI = \frac{\sum (\text{Qubits Committed to ESG}) \times \text{Coherence Time}}{\text{Entropic Footprint Constant}} + \text{Human Flourishing Factor (proxy)}
$$

Below are two reference implementations: one in Streamlit (Python) and one as a React component.

### 1. Streamlit (Python)

Create a file named `qsi_calculator.py`:
```python
import streamlit as st
import random

st.title("Quantum Sustainability Index (QSI) Calculator")
st.caption("Conceptual model for GAIA-QAO")

qubits = st.slider("Effective ESG Qubits", min_value=1, max_value=100, value=40,
                   help="Number of qubits effectively contributing to ESG optimization.")
tau_micro_sec = st.number_input("Coherence time (μs)", min_value=1.0, value=150.0, step=10.0, format="%.1f",
                                help="Average coherence time of the ESG qubits in microseconds.")
tau = tau_micro_sec * 1e-6 # convert to seconds

# Constants (conceptual for this model)
BASE_ENTROPIC_FOOTPRINT = 1.67  # Arbitrary units (e.g., J/photon-mile equivalent)
HFF_MIN = 0.85 # Human Flourishing Factor proxy min
HFF_MAX = 0.95 # Human Flourishing Factor proxy max

def calculate_qsi(qubits: int, tau_seconds: float) -> float:
    # Add a small pseudo-random element to represent the Human Flourishing Factor proxy
    human_flourishing_proxy = random.uniform(HFF_MIN, HFF_MAX)
    if BASE_ENTROPIC_FOOTPRINT == 0: return 0 # Avoid division by zero
    return (qubits * tau_seconds) / BASE_ENTROPIC_FOOTPRINT + human_flourishing_proxy

qsi = calculate_qsi(qubits, tau)

st.metric(label="Calculated QSI", value=f"{qsi:.2f}")

st.markdown("""
**Note:** This calculator is a simplified conceptual model.
- **ESG Qubits:** Represents quantum resources dedicated to sustainability tasks.
- **Coherence Time:** A key factor in quantum computational power.
- **Entropic Footprint Constant:** A placeholder for the system's baseline environmental impact.
- **Human Flourishing Factor (proxy):** A randomized placeholder for complex societal benefits.
""")
```

Run the app:
```bash
pip install streamlit
streamlit run qsi_calculator.py
```

### 2. React (JavaScript/JSX)

Create a file named `QsiCalculator.jsx` (assumes Ant Design for UI components):
```jsx
import React, { useState, useEffect } from 'react';
import { Slider, InputNumber, Card, Typography, Tooltip } from 'antd';
import { QuestionCircleOutlined } from '@ant-design/icons';

const { Title, Text, Paragraph } = Typography;

export default function QsiCalculator() {
  const [qubits, setQubits] = useState(40);
  const [tauMicroSec, setTauMicroSec] = useState(150); // Coherence time in microseconds
  const [qsi, setQsi] = useState(0);

  const BASE_ENTROPIC_FOOTPRINT = 1.67; // Arbitrary units
  const HFF_MIN = 0.85;
  const HFF_MAX = 0.95;

  useEffect(() => {
    const tauSeconds = tauMicroSec * 1e-6;
    const humanFlourishingProxy = Math.random() * (HFF_MAX - HFF_MIN) + HFF_MIN;
    let calculatedQsi = 0;
    if (BASE_ENTROPIC_FOOTPRINT !== 0) {
        calculatedQsi = (qubits * tauSeconds) / BASE_ENTROPIC_FOOTPRINT + humanFlourishingProxy;
    }
    setQsi(calculatedQsi.toFixed(2));
  }, [qubits, tauMicroSec]);

  return (
    <Card title={<Title level={4}>Quantum Sustainability Index (QSI) Calculator</Title>} style={{ maxWidth: 500, margin: 'auto' }}>
      <Paragraph type="secondary">Conceptual model for GAIA-QAO.</Paragraph>
      <div style={{ marginBottom: 20 }}>
        <Text>
            Effective ESG Qubits{' '}
            <Tooltip title="Number of qubits effectively contributing to ESG optimization.">
                <QuestionCircleOutlined />
            </Tooltip>
        : {qubits}</Text>
        <Slider min={1} max={100} value={qubits} onChange={setQubits} />
      </div>
      <div style={{ marginBottom: 20 }}>
        <Text>
            Coherence time (μs){' '}
            <Tooltip title="Average coherence time of the ESG qubits in microseconds.">
                <QuestionCircleOutlined />
            </Tooltip>
        :</Text>
        <InputNumber
            min={1.0}
            step={10.0}
            value={tauMicroSec}
            onChange={value => setTauMicroSec(value || 0)}
            style={{ width: '100%' }}
            formatter={value => `${value} μs`}
            parser={value => value ? value.replace(' μs', '') : ''}
        />
      </div>
      <Title level={3}>QSI: {qsi}</Title>
      <Paragraph type="secondary" style={{ fontSize: '0.8em', marginTop: 16 }}>
        <strong>Note:</strong> This calculator is a simplified conceptual model.
        The QSI attempts to quantify sustainability by factoring in quantum computational power dedicated to ESG goals against a baseline environmental impact, plus a proxy for broader societal benefits.
      </Paragraph>
    </Card>
  );
}
```

To use this component, import and render `<QsiCalculator />` in your React application (ensure `antd` is installed).

## About GAIA-QAO

GAIA-QAO is an organizational structure inspired by the principles of quantum mechanics, such as superposition and entanglement, applied to the management and development of aerospace projects. The goal is to create a dynamic and adaptable model that allows the various components of the organization to operate in multiple functional states simultaneously, thus optimizing responsiveness and efficiency in response to specific operational contexts.
