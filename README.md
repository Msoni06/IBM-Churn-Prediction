# 📉 Advanced Telco Customer Churn Prediction

![Python](https://img.shields.io/badge/Python-3.12-blue)
![XGBoost](https://img.shields.io/badge/Model-XGBoost-orange)
![Power BI](https://img.shields.io/badge/Dashboard-Power%20BI-yellow)

## 📋 Executive Summary
This project helps a Telecom company reduce customer churn by identifying at-risk customers using Machine Learning. The solution includes an end-to-end pipeline: **Data Cleaning**, **EDA**, **XGBoost Modeling (96% Recall)**, **SQL Analysis**, and an interactive **Power BI Dashboard**.

The primary goal was to optimize for **Recall** to ensure we catch the maximum number of potential churners for retention campaigns.

---

## 🛠️ Tech Stack
* **Language:** Python
* **Libraries:** Pandas, NumPy, Scikit-Learn, XGBoost, SHAP, Seaborn, Matplotlib, Imbalanced-Learn
* **Database:** SQLite (Simulated for Analysis)
* **Visualization:** Power BI, Seaborn

---

## 🔍 Key Business Insights (EDA)
1.  **Contract Type:** Customers with **Month-to-Month** contracts are the highest risk group.
2.  **Payment Method:** "Electronic Check" users churn significantly more than those using credit cards.
3.  **Internet Service:** **Fiber Optic** users have high churn rates despite higher monthly charges.

---

## 📊 Dashboard Preview
*An interactive Power BI dashboard was developed to track KPIs, Churn Rate by Contract, and Payment Method analysis.*

![Power BI Dashboard](full_dashboard.png)

---

## 🤖 Machine Learning Model Results
We trained Logistic Regression, Random Forest, and XGBoost. **XGBoost (Tuned)** was selected as the final model.

| Model | Accuracy | Recall (Churners) |
| :--- | :--- | :--- |
| Logistic Regression | 73% | 78% |
| Random Forest | 76% | 56% |
| **XGBoost (Optimized)** | **56%** | **96%** |

**Why 96% Recall?**
We deliberately tuned the model to prioritize Recall over Precision. In a retention scenario, missing a churner (False Negative) is more costly than offering a discount to a loyal customer (False Positive).

---

## 🧠 Model Explainability (SHAP)
Using SHAP values, we identified the top drivers of churn:
1.  **Contract Type** (Month-to-Month)
2.  **Tenure** (New customers < 12 months)
3.  **Total Charges** (High spenders)

---

## 📂 Project Structure
```text
├── data/
│   ├── WA_Fn-UseC_-Telco-Customer-Churn.csv   # Raw Data
│   └── churn_dashboard_data.csv               # Processed Data for Power BI
├── notebooks/
│   └── 01_Data_Cleaning_and_EDA.ipynb         # Full Analysis & Modeling
├── Telco_Churn_Dashboard.pbix                 # Power BI File
├── requirements.txt                           # Dependencies

└── README.md                                  # Project Documentation
