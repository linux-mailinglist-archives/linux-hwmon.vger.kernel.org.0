Return-Path: <linux-hwmon+bounces-4421-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ECB9A06EB
	for <lists+linux-hwmon@lfdr.de>; Wed, 16 Oct 2024 12:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 036D91C2676F
	for <lists+linux-hwmon@lfdr.de>; Wed, 16 Oct 2024 10:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903B520695C;
	Wed, 16 Oct 2024 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="VUninvBx"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EAB206956
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Oct 2024 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074032; cv=none; b=DY0u4Eeo0l0F6duVlAJeaeFG0pYwZ5tSbahvaMva8Qqmqx2nWCZotjk+ixbPqmqnEfI5mUaIxDizWJoTBD+qg/bgVlue8d9CM6bixFlOz//fJIs4zL0wCBhLt0J5Qhnd5R5cUGHo5kabjIHAYpeA3mdQFDejGz+n16vuTdzhTyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074032; c=relaxed/simple;
	bh=JprLKTC6HJjybS1n1cL4X9uzLlKWlrTcyJd8jH5iYLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GDaHK2aDBmNEdcPpAdQ5eTBBqamR1hShJEZEO04DOCdiPTXLH0fa66YxU0TPY/b+7oJ/ZVh2JoTQfDrQW6uI1d5XACE29cB9UUCDkDO0rTQJCtX9cWLwmrutbCIX0K7IxDg0hjLiyuALGrdlbb9bx83x0czstGhKJ5O29jfZJ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=VUninvBx; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7ea6a4f287bso2621697a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Oct 2024 03:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1729074030; x=1729678830; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eu9n9kTYZMIYrnQIr/xJejQUar2J34x4A7S5/oQVpRg=;
        b=VUninvBxgYCjAkAm62Gl1Xvwq3IXqkKp/UQQu9PgF3djl83vKohArpt6XgRiJROTyb
         XV9fdvaujli8oZZHRKnlxN8zad/RMVs2V0OyulDXbjvwyj9TREP+rIkNaTUnEo8Wssc/
         mDq5sRWcjgJLDYP+3QrTEBXxQJvLzHqHKGMHYCRdFs4IxZETBh/J7l+Kio0wdFlhoyfo
         j8nSJsdlFzsdp1hb/RFPEeUe0CzSLPLwM4/Y7eBvDEbmPbAZirfNhXSys2YaO166Gd3e
         xKx/2l/G06ESiFDeoGcK5J5r30e8CR/GRbiWv9K2lERt4ZwoClarztoPrXNEAXGKLdZ+
         EpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729074030; x=1729678830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eu9n9kTYZMIYrnQIr/xJejQUar2J34x4A7S5/oQVpRg=;
        b=B+Cx1dt1f8e4fPIWBY3WNm+VwH+Do0Ew7icoO/usLKHNEuPQMrRR0UxhJv5zHVBOqF
         u44ioPiVa3dxVQ/Bz90BYYHGZ30sfvU+cL8uqFq+CK+3UEnTN6fs9hRLJoW7zXVpPxOL
         S5He4YgJJjXCriHoVMXYfDkv9hMYlDVZ2o6cip5f/WOOzB7kjBCDdAF/5zzYGIqCZ1Cb
         6YWmqmqpSjWOc0/Klo60vZVAlsvEP5BNArXljjw+9twNn8dqzm5kB9V1xdpSHyLm0F1A
         IzsK105MPzrOPAleADr10jhgsXWgCK92ImR7KBwi50bid0u4ajdvvfx+MnJ9scgxyl+h
         zBEA==
X-Forwarded-Encrypted: i=1; AJvYcCXMpbytrV4nuGQP+FKQkLW8xGbHqq95CnjQBPSDh1ifUoHJ9DvQe9Wk7UW4PDjjF7cPwshxZyAcc8TL4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUinORSiV1Va7IA7kxs56Nsq7oz/B5obsr3P5cEs8YEOH17IVy
	lADkVg9msw7UDWzMjWacGplPINX4HCRvQfE1O36kQnqwRQNJsWtKzaekQYw+EojkaR3o5r+ngo5
	Ta0Q38PVOqVI38LwlRt4BkvD/9+Ae7QCfRgdKsA==
X-Google-Smtp-Source: AGHT+IH0NF5PxQ3frSjJAxZyupIfoZEdqDvzpH+HOYXoFDZ6HVhysB/row6aeG7r9j1NrxBIXdKi1U2gHx81js9QOnY=
X-Received: by 2002:a05:6a21:1706:b0:1d8:f048:c0e4 with SMTP id
 adf61e73a8af0-1d8f048c30cmr8138462637.36.1729074030317; Wed, 16 Oct 2024
 03:20:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015113329.667831-1-naresh.solanki@9elements.com>
 <20241015113329.667831-2-naresh.solanki@9elements.com> <c07435f5-af3f-46e2-8e4d-b0a42969b60a@kernel.org>
In-Reply-To: <c07435f5-af3f-46e2-8e4d-b0a42969b60a@kernel.org>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Wed, 16 Oct 2024 15:50:20 +0530
Message-ID: <CABqG17irpNCUks=zg5OpEXqSCUNtWm9X3CpdcZ7AkL0fBdEySA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: hwmon: pmbus: pli209bc: Add bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylvester Bauer <sylv@sylv.io>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 15 Oct 2024 at 17:18, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 15/10/2024 13:33, Naresh Solanki wrote:
> > Add bindings for Vicor pli1209bc.
> > It a Digital Supervisor with Isolation for use with BCM Bus Converter
> > Modules.
> >
> > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > ---
> >  .../bindings/hwmon/pmbus/vicor,pli1209bc.yaml | 65 +++++++++++++++++++
>
> This has to be squashed with previous patch.
>
> >  1 file changed, 65 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/vicor,pli1209bc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/vicor,pli1209bc.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/vicor,pli1209bc.yaml
> > new file mode 100644
> > index 000000000000..3647d14e9111
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/vicor,pli1209bc.yaml
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
>
> Drop blank line
Ack
>
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/vicor,pli1209bc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Vicor PLI1209BC Power Regulator
> > +
> > +maintainers:
> > +  - Marcello Sylvester Bauer <sylv@sylv.io>
> > +  - Naresh Solanki <naresh.solanki@9elements.com>
> > +
> > +description: |
>
> Do not need '|' unless you need to preserve formatting.
Ack
>
> > +  The Vicor PLI1209BC is a Digital Supervisor with Isolation for use
> > +  with BCM Bus Converter Modules.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - vicor,pli1209bc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  regulators:
>
> Drop the node and define vout2 here directly.... unless anything needs
> such layout? Then explain this in commit msg.
This is expected by pmbus regulator driver:
https://github.com/torvalds/linux/blob/master/drivers/hwmon/pmbus/pmbus.h#L512
>
> > +    type: object
> > +    description:
> > +      List of regulators provided by this controller.
> > +
> > +    properties:
> > +      vout2:
> > +        $ref: /schemas/regulator/regulator.yaml#
> > +        type: object
> > +
>
> Drop blank line.
Ack
>
> > +        unevaluatedProperties: false
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
>
> Drop, not used.
Ack
>
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        pli1209bc_p12v_d: regulator@5f {
>
> Drop unused prefix
Ack

Regards,
Naresh
>
> > +            compatible = "vicor,pli1209bc";
> > +            reg = <0x5f>;
> > +
> > +            regulators {
> > +                p12v_d: vout2 {
> > +                    regulator-name = "bcm3";
> > +                    regulator-boot-on;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
>
> Best regards,
> Krzysztof
>

