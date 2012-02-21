// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.energyos.espi.thirdparty.web;

import java.lang.String;
import org.energyos.espi.thirdparty.domain.DataCustodian;
import org.energyos.espi.thirdparty.domain.IntervalReading;
import org.energyos.espi.thirdparty.domain.MeterReading;
import org.energyos.espi.thirdparty.domain.RetailCustomer;
import org.energyos.espi.thirdparty.domain.ThirdParty;
import org.energyos.espi.thirdparty.domain.UsagePoint;
import org.energyos.espi.thirdparty.domain.UsagePointAsset;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(new DataCustodianConverter());
        registry.addConverter(new IntervalReadingConverter());
        registry.addConverter(new MeterReadingConverter());
        registry.addConverter(new RetailCustomerConverter());
        registry.addConverter(new ThirdPartyConverter());
        registry.addConverter(new UsagePointConverter());
        registry.addConverter(new UsagePointAssetConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
    static class org.energyos.espi.thirdparty.web.ApplicationConversionServiceFactoryBean.DataCustodianConverter implements Converter<DataCustodian, String> {
        public String convert(DataCustodian dataCustodian) {
            return new StringBuilder().append(dataCustodian.getName()).append(" ").append(dataCustodian.getDescription()).toString();
        }
        
    }
    
    static class org.energyos.espi.thirdparty.web.ApplicationConversionServiceFactoryBean.IntervalReadingConverter implements Converter<IntervalReading, String> {
        public String convert(IntervalReading intervalReading) {
            return new StringBuilder().append(intervalReading.getCost()).append(" ").append(intervalReading.getReading()).append(" ").append(intervalReading.getStartDate()).append(" ").append(intervalReading.getEndDate()).toString();
        }
        
    }
    
    static class org.energyos.espi.thirdparty.web.ApplicationConversionServiceFactoryBean.MeterReadingConverter implements Converter<MeterReading, String> {
        public String convert(MeterReading meterReading) {
            return new StringBuilder().append(meterReading.getName()).append(" ").append(meterReading.getDescription()).toString();
        }
        
    }
    
    static class org.energyos.espi.thirdparty.web.ApplicationConversionServiceFactoryBean.RetailCustomerConverter implements Converter<RetailCustomer, String> {
        public String convert(RetailCustomer retailCustomer) {
            return new StringBuilder().append(retailCustomer.getFirstName()).append(" ").append(retailCustomer.getLastName()).append(" ").append(retailCustomer.getEmail()).append(" ").append(retailCustomer.getCustomerSince()).toString();
        }
        
    }
    
    static class org.energyos.espi.thirdparty.web.ApplicationConversionServiceFactoryBean.ThirdPartyConverter implements Converter<ThirdParty, String> {
        public String convert(ThirdParty thirdParty) {
            return new StringBuilder().append(thirdParty.getName()).append(" ").append(thirdParty.getDescription()).toString();
        }
        
    }
    
    static class org.energyos.espi.thirdparty.web.ApplicationConversionServiceFactoryBean.UsagePointConverter implements Converter<UsagePoint, String> {
        public String convert(UsagePoint usagePoint) {
            return new StringBuilder().append(usagePoint.getAddress()).append(" ").append(usagePoint.getCity()).toString();
        }
        
    }
    
    static class org.energyos.espi.thirdparty.web.ApplicationConversionServiceFactoryBean.UsagePointAssetConverter implements Converter<UsagePointAsset, String> {
        public String convert(UsagePointAsset usagePointAsset) {
            return new StringBuilder().append(usagePointAsset.getName()).toString();
        }
        
    }
    
}