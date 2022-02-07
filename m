Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C23984AB8B6
	for <lists+linux-hwmon@lfdr.de>; Mon,  7 Feb 2022 11:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234688AbiBGKXT (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 7 Feb 2022 05:23:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353031AbiBGKJg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Feb 2022 05:09:36 -0500
X-Greylist: delayed 325 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 02:09:35 PST
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [IPv6:2001:67c:2050::465:103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA60C0401D5;
        Mon,  7 Feb 2022 02:09:34 -0800 (PST)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:105:465:1:3:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4JshYw4RfSz9sm4;
        Mon,  7 Feb 2022 11:04:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sylv.io; s=MBO0001;
        t=1644228242;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lN4utUrYnahAfNJMengCSqnxamFQ+RDYj7VC6iGzs8o=;
        b=uaDu06mkyWWu6fHMfq9g7S/EROLb6UanxWi5afFEYrUdoCRlF+PErJmMIp/RejFc0TKGeB
        8LFqvUnBk1cKjQU0Q/+e+ajKUo7306gw/NNzJjXpiXxKsplT9aSGc4k2Qhhz7K4DRNzJxC
        l1/Rc/rFLLtmVbk4WDe69znnkEg+ypmqqgEG8tKIR/jJesAAw11jBh357Kej1AjR6s9CtC
        DE7xuwUSusIE49rHopdhFwrT78oDCBtPQjRtLT4amH4vM7SjjDKzWEBbf65BzPoAKKos0N
        7oV+t1w47U9NSWsGLL+JwNAnqogO1JExWdy1Vc2Vpz+G8OEbLoTmPVT9Xd61vA==
Message-ID: <b55f673b2ba25dbdfeafd4558f5cd2ba2ca0ee39.camel@sylv.io>
Subject: Re: [PATCH v4 3/4] dt-bindings: hwmon: Add binding for max6639
From:   sylv <sylv@sylv.io>
To:     Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Jean Delvare <jdelvare@suse.com>,
        Roland Stigge <stigge@antcom.de>, devicetree@vger.kernel.org
Date:   Mon, 07 Feb 2022 11:03:54 +0100
In-Reply-To: <Yf23k5vrZ8CEAKda@robh.at.kernel.org>
References: <cover.1643299570.git.sylv@sylv.io>
         <224e73b57101aa744244bd396a700d5365eb72ec.1643299570.git.sylv@sylv.io>
         <Yf23k5vrZ8CEAKda@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 2022-02-04 at 17:32 -0600, Rob Herring wrote:
> On Thu, Jan 27, 2022 at 05:17:29PM +0100, Marcello Sylvester Bauer
> wrote:
> > Add Devicetree binding documentation for Maxim MAX6639 temperature
> > monitor with PWM fan-speed controller.
> > 
> > The devicetree documentation for the SD3078 device tree.
> > 
> > Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
> > ---
> >  .../bindings/hwmon/maxim,max6639.yaml         | 112
> > ++++++++++++++++++
> >  1 file changed, 112 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> > b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> > new file mode 100644
> > index 000000000000..570e9fe07503
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
> > @@ -0,0 +1,112 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/hwmon/maxim,max6639.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Maxim max6639
> > +
> > +maintainers:
> > +  - Roland Stigge <stigge@antcom.de>
> > +
> > +description: |
> > +  The MAX6639 is a 2-channel temperature monitor with dual,
> > automatic, PWM
> > +  fan-speed controller.  It monitors its own temperature and one
> > external
> > +  diode-connected transistor or the temperatures of two external
> > diode-connected
> > +  transistors, typically available in CPUs, FPGAs, or GPUs.
> > +
> > +  Datasheets:
> > +   
> > https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - maxim,max6639
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "channel@0"
> > +  - "channel@1"
> > +
> > +additionalProperties: false
> > +
> > +patternProperties:
> > +  "^channel@[0-1]$":
> 
> fan@...

Makes sense. Looks like i have to adapt the driver code too.

> 
> > +    type: object
> > +    description: |
> > +      Represents the two fans and their specific configuration.
> > +
> > +    properties:
> > +      reg:
> > +        description: |
> > +          The fan number.
> > +        items:
> > +          minimum: 0
> > +          maximum: 1
> > +
> > +      pwm-polarity:
> 
> See PWM_POLARITY_INVERTED
> 

Indeed, Thanks.

> 
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1]
> > +        default: 1
> > +        description:
> > +          PWM output is low at 100% duty cycle when this bit is
> > set to zero. PWM
> > +          output is high at 100% duty cycle when this bit is set
> > to 1.
> > +
> > +      pulses-per-revolution:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [1, 2, 3, 4]
> > +        default: 2
> > +        description:
> > +          Value specifying the number of pulses per revolution of
> > the controlled
> > +          FAN.
> > +
> > +      rpm-max:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [2000, 4000, 8000, 16000]
> > +        default: 4000
> > +        description:
> > +          Scales the tachometer counter by setting the maximum
> > (full-scale) value
> > +          of the RPM range.
> 
> Why do you need to know the max? I don't recall needing this for
> other 
> fan controller bindings.

This information is required for setting the internal clock of the
tachometer. (See: page 8 table 3). However, we could make it a vendor
specific property. In this case i would rather call it "maxim,rpm-
range", since this is how it is referred to.

Or is there a better how to define this information inside dt?

> 
> All this needs to be pulled out to a common schema fan that is 
> referenced.

Ack

thanks,
Marcello

> 
> > +
> > +    required:
> > +      - reg
> 
> This should all be in a common fan schema that can be re
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      max6639@10 {
> > +        compatible = "maxim,max6639";
> > +        reg = <0x10>;
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        channel@0 {
> > +          reg = <0x0>;
> > +          pwm-polarity = <1>;
> > +          pulses-per-revolution = <2>;
> > +          rpm-range = <4000>;
> > +        };
> > +
> > +        channel@1 {
> > +          reg = <0x1>;
> > +          pwm-polarity = <1>;
> > +          pulses-per-revolution = <2>;
> > +          rpm-range = <4000>;
> > +        };
> > +      };
> > +    };
> > +...
> > -- 
> > 2.34.1
> > 
> > 

