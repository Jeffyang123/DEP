#### **Files** options

- For **Peptides.txt :** It requires tabular input (e.g. txt files) as generated by quantitative analysis softwares of raw mass spectrometry data, such as Peptides.txt from MaxQuant or quantity data from other software. It should in a wide format that each rows are different peptides and columns is identification information (including the proteins that peptide from)and quantification columns for each samples.
- For **ExperimentalDesign.txt :** Data frame, Experimental design with 'label', 'condition' and 'replicate' information. `Note that` : you need not upload the ExperimentalDesign.txt when `Sample annotation` is setted to `Parse from columns`.
  + **label :** Label names
  + **condition :** Experimental conditions
  + **replicate :** Replicate number
- For **aggregated result RData :** The aggrageted result from `save aggregation result` button in previous analysis.



#### **Data proccess** options

**Protein name column**: the column in **ProteinGroups** that store gene name of gene symbol.

**Protein ID column**: the column in **ProteinGroups** that store protein ID or protein name.

**Delimiter**: the delimiter in group to separate members.

**Filter on columns**: optional. The columns that filter based on. The features with non-"" value in one of these columns will be filtered out. Such as reverse or contaminant groups.

**Allowed max.miss.num at least one condition**: the threshold of miss values in one condition.

**Expression columns**: the columns store expression data (like intensity or quantity).

**Imputation before normalization**: impute missing values before or after normalization

**Peptide normalization method**: normalization approach. `Quantiles.robust` can't handle data containing missing values.



### **Analysis steps**:

1. Upload peptide data, set opthions in Peptides `Files`, `Data proccess`, `Aggregation` pannels.
2. Click `Aggregate` and wait.
3. Set Differential test options in `Columns`, `FDR correction` and `Threshold method` pannels.
4. Click `Analyze`.

