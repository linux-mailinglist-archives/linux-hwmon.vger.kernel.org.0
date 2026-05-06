Return-Path: <linux-hwmon+bounces-13800-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOKyKJZf+2kuaQMAu9opvQ
	(envelope-from <linux-hwmon+bounces-13800-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 06 May 2026 17:34:46 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BF94DD51F
	for <lists+linux-hwmon@lfdr.de>; Wed, 06 May 2026 17:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32F533001FF8
	for <lists+linux-hwmon@lfdr.de>; Wed,  6 May 2026 15:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FD03EFD27;
	Wed,  6 May 2026 15:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MpoQX4Q3"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D32481FA6;
	Wed,  6 May 2026 15:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081682; cv=none; b=e+3vf0UeLO8EY9HMvWrxF3vzMUcxsStoje+I+vyLcR1HL57LLPTzwxRq7rYFW+6GzvZez9pOg9YRneXzfH5Nq+JdNsJ32j6pmqCsGYWnEpKsFBLt4Tn4c17BW6RSXL+WWcQb1XdZB3wIfnUhpyFe0hn14N1QuG6ZImuEkMo/BaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081682; c=relaxed/simple;
	bh=jstTZtUvnr6c+EldYs7tU7NjsmlWb9VuAIh2o4woyis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDjQFcxypNm03qsNX8I9g15PPZ6zqVZ/mv9QPtPp31BNMnvEGTJIUBgLLYW01DtLDY7yRwSJgMsG5tlzybamIfyY9O0Rd+lOazH1mZtbahzHujsFcB3DtOPjUMp/cdMJ97oyeOQjCDRav/0lsEhsHe8K4gqBhncEeuK6UtdigXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MpoQX4Q3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95142C2BCB8;
	Wed,  6 May 2026 15:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778081681;
	bh=jstTZtUvnr6c+EldYs7tU7NjsmlWb9VuAIh2o4woyis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MpoQX4Q3BUZODXFtmnceXWajgjhsEMMRuK5ua2RHPKAvdh0ndBs7L4UaJO8MBoQMp
	 hCkCN0yS+ZfceiaGXb1V7QQttkTj3ywBVtR4/TtlOsCGgGCIQVL0tnzUUXnESaJgwR
	 2E90jxohpVVz8VLExWvRgV/htP/HA6wKcuqyzz+hthVXmmRDnbTX9ATR6BcBCmJ92Z
	 6RIUhYR8yXHguBP1pxuYhjKpb4CaUtfLp0/R5WGcqTf5C3DQFk5kmdv961ARWiGge2
	 Ghyt0zBB5JU+8ihzL5odkg87+4Mt/OOpphMmQ41EHc0fRl8cr2V3FgoLC1/ZtgB6Fs
	 /Gsr4RG6G4YNA==
Date: Wed, 6 May 2026 10:34:39 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko@lists.linux.dev
Cc: Marius Cristea <marius.cristea@microchip.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v10 1/2] dt-bindings: hwmon: temperature: add support for
 EMC1812
Message-ID: <20260506153439.GA2166500-robh@kernel.org>
References: <20260429-hw_mon-emc1812-v10-1-a8ca1d779502@microchip.com>
 <20260429132458.920C8C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429132458.920C8C2BCB8@smtp.kernel.org>
X-Rspamd-Queue-Id: 41BF94DD51F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13800-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.4:email]

On Wed, Apr 29, 2026 at 01:24:57PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] The restriction for channel 4 on the `microchip,emc1814` compatible uses `properties: channel@4: false`, which violates the dt-schema meta-schema and will cause `dt_binding_check` to fail.
> - [Low] The device tree example uses an undefined phandle label `<&vdd>`, which will cause `dt_binding_check` to fail with a `dtc` compilation error.
> --
> 
> commit 6d9c42d650361ba383a1097abf05acff51bac85d
> Author: Marius Cristea <marius.cristea@microchip.com>
> 
> dt-bindings: hwmon: temperature: add support for EMC1812
> 
> This commit adds the devicetree schema for the Microchip EMC1812/13/14/15/33
> Multichannel Low-Voltage Remote Diode Sensor Family. It specifies the properties
> for each hardware variant, including differences in channel count and features
> like anti-parallel diodes.
> 
> > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
> > new file mode 100644
> > index 000000000000..1a273621db82
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
> [ ... ]
> > +  # EMC1814: 1 Internal, 3 External Channels, Supports APD,
> > +  # parasitic-res-on-channel1-2: on both channel 1 & 2
> > +  # parasitic-res-on-channel3-4: for channel 3
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: microchip,emc1814
> > +    then:
> > +      properties:
> > +        channel@4: false
> 
> Should this restriction be placed under patternProperties instead of
> properties?
> 
> In dt-schema, keys under properties must not contain the @ symbol used for
> device tree unit addresses. Using channel@4: false under properties will result
> in a meta-schema validation regression during make dt_binding_check.
> 
> To properly forbid the node, it could be written under patternProperties,
> such as "^channel@4$": false.

No.

> 
> [ ... ]
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        temperature-sensor@4c {
> > +            compatible = "microchip,emc1813";
> > +            reg = <0x4c>;
> > +
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            microchip,parasitic-res-on-channel1-2;
> > +
> > +            vdd-supply = <&vdd>;
> 
> Does this example need a node defining the vdd label?
> 
> The assignment uses the phandle <&vdd>, but the label is not defined anywhere in
> the example block. When make dt_binding_check extracts and compiles the
> generated DTS, this will result in a dtc compilation regression because the
> phandle cannot be resolved.
> 
> Adding a dummy regulator node with the vdd: label would fix this.

No.

