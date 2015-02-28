package main

import (
	"encoding/xml"
	"fmt"
	"io/ioutil"
)

// Structures parsed out of SCIP Doxygen XML, along with other useful
// things like C -> Julia type mappings.

// Example XML:
/*
<doxygen>
    <compounddef>
        <sectiondef kind="define|enum|typedef">
            <memberdef kind="define">
                <name>SCIP_Bool</name>
                <initializer>unsigned int</initializer>
      		</memberdef>
        </sectiondef>
    </compounddef>
</doxygen>
*/
type Doxygen struct {
	CompoundDef struct {
		SectionDefs []struct {
			Kind       string `xml:"kind,attr"`
			MemberDefs []struct {
				Kind        string `xml:"kind,attr"`
				Name        string `xml:"name"`
				Initializer string `xml:"initializer"`
			} `xml:"memberdef"`
		} `xml:"sectiondef"`
	} `xml:"compounddef"`
}

func Parse(path string) (*Doxygen, error) {
	contents, err := ioutil.ReadFile(path)
	if err != nil {
		return nil, fmt.Errorf("unable to read file %s: %v\n", path, err)
	}

	var scipCDef Doxygen
	err = xml.Unmarshal(contents, &scipCDef)
	if err != nil {
		return nil, fmt.Errorf("unable to parse xml file %s: %v\n", path, err)
	}

	return &scipCDef, nil
}