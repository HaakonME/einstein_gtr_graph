:begin
CREATE CONSTRAINT UNIQUE_IMPORT_NAME FOR (node:`UNIQUE IMPORT LABEL`) REQUIRE (node.`UNIQUE IMPORT ID`) IS UNIQUE;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{_id:0, properties:{name:"Spacetime", description:"The four-dimensional continuum of space and time. In General Relativity, it's portrayed as a fabric that can be curved by the presence of mass and energy."}}, {_id:1, properties:{name:"Curvature", description:"In General Relativity, curvature of spacetime is caused by the presence of mass or energy and in turn, tells mass how to move."}}, {_id:2, properties:{name:"Mass", description:"A property of physical objects that quantifies the amount of matter. In General Relativity, mass is a key source of spacetime curvature."}}, {_id:3, properties:{name:"Energy", description:"A quantitative property that can be transferred to an object to perform work. In General Relativity, energy (like mass) influences the curvature of spacetime."}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Concept;
UNWIND [{_id:8, properties:{name:"General Theory of Relativity", description:"A theory of gravitation that generalizes Special Relativity to non-inertial frames of reference. It introduces the concept that measurements of space and time are relative to the observer's motion, especially in the presence of gravitational fields."}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Theory;
UNWIND [{_id:4, properties:{name:"Einstein Field Equations", description:"A set of ten interrelated differential equations. The solutions of EFE describe the fundamental interaction of gravitation as a result of spacetime being curved by matter and energy."}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Equation;
UNWIND [{_id:6, properties:{name:"Gravitational Lensing", description:"The bending of light rays by gravity from a massive object, like a galaxy or black hole, observable as distorted images of distant stars and galaxies."}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Phenomenon;
UNWIND [{_id:7, properties:{name:"Schwarzschild Solution", description:"A solution to Einstein's Field Equations describing the spacetime geometry outside a spherical, non-rotating mass like a static star or black hole."}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Solution;
UNWIND [{_id:5, properties:{name:"Equivalence Principle", description:"A principle stating that the gravitational force experienced by an object is indistinguishable from the pseudo-force experienced by an observer in a non-inertial (accelerated) frame of reference."}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Principle;
:commit
:begin
UNWIND [{start: {_id:7}, end: {_id:1}, properties:{description:"The Schwarzschild Solution demonstrates the curvature of spacetime around a spherically symmetric mass like a static star or black hole."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:DEMONSTRATES]->(end) SET r += row.properties;
UNWIND [{start: {_id:8}, end: {_id:5}, properties:{description:"The General Theory of Relativity incorporates the Equivalence Principle, which posits that gravitational mass and inertial mass are equivalent."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INCORPORATES]->(end) SET r += row.properties;
UNWIND [{start: {_id:4}, end: {_id:7}, properties:{description:"The Schwarzschild Solution is a direct and significant solution of the Einstein Field Equations, representing the spacetime geometry around a non-rotating, spherically symmetric mass in a vacuum."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SOLUTION]->(end) SET r += row.properties;
UNWIND [{start: {_id:4}, end: {_id:2}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:RELATES_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:7}, end: {_id:6}, properties:{description:"The Schwarzschild Solution explains the phenomenon of Gravitational Lensing, where light bends around a massive object, such as a black hole or galaxy."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:EXPLAINS]->(end) SET r += row.properties;
UNWIND [{start: {_id:3}, end: {_id:2}, properties:{description:"Energy and mass are interchangeable, as described by Einstein's famous equation E=mc^2, illustrating a fundamental principle of General Relativity."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:EQUIVALENT_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:6}, end: {_id:1}, properties:{description:"Gravitational lensing, where light bends around massive objects, is a direct effect of the curvature of spacetime caused by mass."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CAUSED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:7}, end: {_id:0}, properties:{description:"The Schwarzschild Solution describes the nature of spacetime around a non-rotating, spherically symmetric mass."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:DESCRIBES_SPACETIME_AROUND]->(end) SET r += row.properties;
UNWIND [{start: {_id:8}, end: {_id:6}, properties:{description:"The General Theory of Relativity predicts the phenomenon of Gravitational Lensing, where light bends around massive objects due to spacetime curvature."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PREDICTS]->(end) SET r += row.properties;
UNWIND [{start: {_id:4}, end: {_id:0}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:DESCRIBES]->(end) SET r += row.properties;
UNWIND [{start: {_id:8}, end: {_id:0}, properties:{description:"The General Theory of Relativity revolutionized the concept of spacetime, describing it as a dynamic, curved fabric influenced by mass and energy."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ALTERS_CONCEPT_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:5}, end: {_id:2}, properties:{description:"The Equivalence Principle explains how mass and energy interact with spacetime, underpinning their roles in the curvature of spacetime."}}, {start: {_id:5}, end: {_id:3}, properties:{description:"The Equivalence Principle explains how mass and energy interact with spacetime, underpinning their roles in the curvature of spacetime."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:EXPLAINS_INTERACTION_WITH]->(end) SET r += row.properties;
UNWIND [{start: {_id:8}, end: {_id:1}, properties:{description:"The General Theory of Relativity explains how the presence of mass and energy leads to the curvature of spacetime, a fundamental aspect of the theory."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:EXPLAINS]->(end) SET r += row.properties;
UNWIND [{start: {_id:8}, end: {_id:4}, properties:{description:"The General Theory of Relativity is fundamentally based on the Einstein Field Equations, which describe the relationship between spacetime and matter/energy."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BASED_ON]->(end) SET r += row.properties;
UNWIND [{start: {_id:1}, end: {_id:4}, properties:{description:"The Einstein Field Equations mathematically describe how mass and energy determine the curvature of spacetime."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:DESCRIBEDBY]->(end) SET r += row.properties;
UNWIND [{start: {_id:4}, end: {_id:6}, properties:{description:"The Einstein Field Equations predict phenomena like gravitational lensing, demonstrating how mass and energy affect spacetime to bend light."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PREDICTS]->(end) SET r += row.properties;
UNWIND [{start: {_id:5}, end: {_id:0}, properties:{description:"The Equivalence Principle is key to understanding how gravity is a manifestation of spacetime curvature, rather than a conventional force."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:DEFINES_GRAVITY_IN]->(end) SET r += row.properties;
UNWIND [{start: {_id:5}, end: {_id:1}, properties:{description:"The Equivalence Principle implies that the presence of mass and energy leads to the curvature of spacetime, a core concept in General Relativity."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:IMPLIES]->(end) SET r += row.properties;
UNWIND [{start: {_id:2}, end: {_id:0}, properties:{description:"Mass causes the curvature of spacetime. This relationship is fundamental to understanding gravity in General Relativity."}}, {start: {_id:3}, end: {_id:0}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INFLUENCES]->(end) SET r += row.properties;
UNWIND [{start: {_id:1}, end: {_id:2}, properties:{description:"The curvature of spacetime guides the movement of mass, determining the paths of planets, stars, and galaxies."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:GUIDES_MOVEMENT_OF]->(end) SET r += row.properties;
UNWIND [{start: {_id:3}, end: {_id:4}, properties:{description:"Just like mass, energy also contributes to the curvature of spacetime, as described by the Einstein Field Equations."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CONTRIBUTES_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:8}, end: {_id:7}, properties:{description:"The Schwarzschild Solution, a key solution of the Einstein Field Equations, emerges from the principles of the General Theory of Relativity and describes the spacetime around a spherical, non-rotating mass."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:HAS_SOLUTION]->(end) SET r += row.properties;
UNWIND [{start: {_id:5}, end: {_id:4}, properties:{description:"The Equivalence Principle, which states that gravitational mass and inertial mass are equivalent, is a foundational concept in the Einstein Field Equations."}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BASEDON]->(end) SET r += row.properties;
:commit
:begin
MATCH (n:`UNIQUE IMPORT LABEL`)  WITH n LIMIT 20000 REMOVE n:`UNIQUE IMPORT LABEL` REMOVE n.`UNIQUE IMPORT ID`;
:commit
:begin
DROP CONSTRAINT UNIQUE_IMPORT_NAME;
:commit
